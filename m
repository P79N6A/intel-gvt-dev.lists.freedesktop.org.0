Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp7555558ywo;
        Thu, 11 Apr 2019 18:51:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwTrZrmybLyhy6oBrDcU3J6/S+RbGwhkZgMgVShSXx0l/Mbh+m7p6BlvQC9sjNSzupcKfWD
X-Received: by 2002:aa7:8d9a:: with SMTP id i26mr41523548pfr.220.1555033896649;
        Thu, 11 Apr 2019 18:51:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555033896; cv=none;
        d=google.com; s=arc-20160816;
        b=Fn/1iH2Yzq70htmzLBhSbkw+SSkTLNy4U3cDG+KGA/IGfpTp83b6LH5XwjbwF+G9Tt
         38EUqexYJhTcLTpp57HHHvOx0fhWtKYHvoKm21sxFQrxZRAYIT8YjMSi+THhZvZh9M8P
         t5zWL6hXGM1bFhyRAQq2ejwm9ptfS4m9+SaBBbND+/iTyaohxxBkvkK/FVj9LZN9Heq1
         bIL4YRNvUMv48hp0qxvnmC6wmn8BhMbPLTVwqPo9khAyRSKshuKaPuuu54dfvF+/xK49
         6v33F63FN3/s8gl1g6lg56V5Y6y8u0YNuePPoRBFvg0jPsihc0F2e/246N92laPhTUhH
         20uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:reply-to:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:content-language:in-reply-to:mime-version:user-agent
         :date:message-id:from:references:to:subject:delivered-to;
        bh=FKERP/d5oofUMt22fRi/3SpalsQ7tfljwyldO82q6jM=;
        b=hd9UEir3RJHOPmF8i/qFHOxWqvnmcI3jt5+grJDfbjjPqyv9IkZu3JOeTVDy7NeaFh
         Cbzh09horBAspdSTRVuReb0iwXyZM7qZQq/S59z3v1VEgyvGmBldLtcxotsZVNzljHsr
         UUxevScy3QqcxoTTjIYdoil7MNBqJPgAniw7T50nyBp9Ixl4rGfIfXvxibMd3Tw8nQDw
         ajgpt2MBr0YbR+wveb8GDk0dgOnI1L/2X/QzO3cL6q43BMiBxYHQTc7bL5DNjU4XAxcR
         o6TGjm28qpDP+cxKhslnZZ529l2gRBohGa74JijxAJTS8O5g9hP17UYDABEWAEBmO/do
         redQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id z11si36303294pfa.153.2019.04.11.18.51.36
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2019 18:51:36 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 390A689856;
	Fri, 12 Apr 2019 01:51:36 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8101989852
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 12 Apr 2019 01:51:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Apr 2019 18:51:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,339,1549958400"; d="scan'208";a="148565502"
Received: from coxu-arch-shz.sh.intel.com (HELO [10.239.160.21])
 ([10.239.160.21])
 by FMSMGA003.fm.intel.com with ESMTP; 11 Apr 2019 18:51:33 -0700
Subject: Re: [PATCH V2 6/6] drm/i915/gvt: Check if get_next_pt_type() always
 returns a valid value
To: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>
References: <20190411104631.7627-1-aleksei.gimbitskii@intel.com>
 <20190411104631.7627-7-aleksei.gimbitskii@intel.com>
From: Colin Xu <Colin.Xu@intel.com>
Message-ID: <6e05900f-b883-83d2-41ad-f6600b3685bb@intel.com>
Date: Fri, 12 Apr 2019 09:51:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190411104631.7627-7-aleksei.gimbitskii@intel.com>
Content-Language: en-US
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: "Intel GVT \(Graphics Virtualization\) development list"
 <intel-gvt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gvt-dev>
List-Post: <mailto:intel-gvt-dev@lists.freedesktop.org>
List-Help: <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: Colin.Xu@intel.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Ck9uIDIwMTktMDQtMTEgMTg6NDYsIEFsZWtzZWkgR2ltYml0c2tpaSB3cm90ZToKPiBBY2NvcmRp
bmcgdG8gZ3R0X3R5cGVfdGFibGVbXSBmdW5jdGlvbiBnZXRfbmV4dF9wdF90eXBlKCkgbWF5IHJl
dHVybnMKPiBHVFRfVFlQRV9JTlZBTElEIGluIHNvbWUgY2FzZXMuIFRvIHByZXZlbnQgZHJpdmVy
IHRvIHRyeSB0byBjcmVhdGUgbWVtb3J5Cj4gcGFnZSB3aXRoIGludmFsaWQgZGF0YSB0eXBlLCBh
ZGRpdGlvbmFsIGNoZWNrIGlzIGFkZGVkLgo+Cj4gU2lnbmVkLW9mZi1ieTogQWxla3NlaSBHaW1i
aXRza2lpIDxhbGVrc2VpLmdpbWJpdHNraWlAaW50ZWwuY29tPgo+IENjOiBaaGVueXUgV2FuZyA8
emhlbnl1d0BsaW51eC5pbnRlbC5jb20+Cj4gQ2M6IFpoaSBXYW5nIDx6aGkuYS53YW5nQGludGVs
LmNvbT4KPiBDYzogQ29saW4gWHUgPGNvbGluLnh1QGludGVsLmNvbT4KPiAtLS0KPiAgIGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYyB8IDMgKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0
dC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jCj4gaW5kZXggOTVjZDhmMjVkNmY5
Li5jOTNlN2EzYTdmMzYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0
dC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jCj4gQEAgLTEwNzksNiAr
MTA3OSw5IEBAIHN0YXRpYyBzdHJ1Y3QgaW50ZWxfdmdwdV9wcGd0dF9zcHQgKnBwZ3R0X3BvcHVs
YXRlX3NwdF9ieV9ndWVzdF9lbnRyeSgKPiAgIAl9IGVsc2Ugewo+ICAgCQlpbnQgdHlwZSA9IGdl
dF9uZXh0X3B0X3R5cGUod2UtPnR5cGUpOwo+ICAgCj4gKwkJaWYgKCFndHRfdHlwZV9pc19wdCh0
eXBlKSkKPiArCQkJZ290byBlcnI7Cj4gKwoKTG9naWNhbGx5IGl0J3MgT0sgc2luY2UgaXQgZ3Vh
cmFudGVlcyB2YWxpZCBzcHQtPnNoYWRvd19wYWdlLnR5cGUgb3Igc3B0LT5ndWVzdF9wYWdlLnR5
cGUuCgpJJ20gc3RpbGwgbm90IHN1cmUgd2hpY2ggd2F5IHRvIGNoYW5nZSBpcyBiZXR0ZXIsIHNl
ZSBjb21tZW50cyBpbiBbcGF0Y2ggdjIgMS82XS4KTG9va2luZyBmb3J3YXJkIGNvbW1lbnRzIGZy
b20gb3RoZXJzLgoKPiAgIAkJc3B0ID0gcHBndHRfYWxsb2Nfc3B0X2dmbih2Z3B1LCB0eXBlLCBv
cHMtPmdldF9wZm4od2UpLCBpcHMpOwo+ICAgCQlpZiAoSVNfRVJSKHNwdCkpIHsKPiAgIAkJCXJl
dCA9IFBUUl9FUlIoc3B0KTsKCi0tIApCZXN0IFJlZ2FyZHMsCkNvbGluIFh1CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxp
bmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
