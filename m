Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp7544927ywo;
        Thu, 11 Apr 2019 18:35:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqztvHm6RuZl6J/z2xZDiZaX5r0LIwvA4pGCQODfzJa+pMAIq9n2fPMlghYlQuRgL+h8meem
X-Received: by 2002:a62:e518:: with SMTP id n24mr53694366pff.174.1555032907868;
        Thu, 11 Apr 2019 18:35:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555032907; cv=none;
        d=google.com; s=arc-20160816;
        b=d+kzg6ZOZUAqdAoackuUjJGRxMuN5cDp2QT/Da0YIpE0mNdlFghPu5VMUn/1w314qH
         QQarcov9gfZaQ9ZaPneWLfm+Cje7WAfPEHTdE7UeZytIzrZ6Dxe1QbGX2hY4/lLRQfyC
         rlgiiT/ZI+HbKah7Xc4DaV5KHxGjzTPioe1zb7OX6rAHWxGjkUCG1PJe56B5Y3aB7NCe
         3G7lJSpzhRKsBUnjIwze0gMLNI7+a63M8KjCu2n8g36BCDdjG4zLLMolggwfUnLgLCtR
         1Xebu7kCMO8BLqniM4MI/qRbobvn0XWUfN9tHUKvyUdmsIg5lvmgHRV99dGrNNiX+YLy
         8CZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:reply-to
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject:delivered-to;
        bh=30GDgL92dDLXCgyo7YIdzL8kt0LiLxirdW7oyYmx0zQ=;
        b=ZgakzfE8Oo7p8IMlr6+goYH+0d8TaaYNWzEdc6AXVE2SeWq8ahttuFp21wp9aXO+cU
         b44J0xbFVEVfLJos00r/cFRnngnIBOyqhGwBdCFIhC5TFeu35RQK8CUQSP4YXoZaELAd
         cTZwXB4I0Z2O8qxpLO85mp34A5Io2R09kfJYsMv4DcS9lD7FQ2ZV+prYpQICtjonrf6H
         ywj/3VsFzCtcHnk7s3BIUueTKsprlIFMnfJK/HxDPq6R2fagERIAQBG94gnk0ZlbDH9a
         SDaLOsRfjSwj8yGbourlsSevMmpRpqORfTx1/If3ZzgSaHV+Pl5MD+BiNvdkWC8mWkID
         x/qA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id f127si19750146pfc.176.2019.04.11.18.35.07
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2019 18:35:07 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75201897F6;
	Fri, 12 Apr 2019 01:35:07 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20841897F6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 12 Apr 2019 01:35:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Apr 2019 18:35:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,339,1549958400"; d="scan'208";a="148561547"
Received: from coxu-arch-shz.sh.intel.com (HELO [10.239.160.21])
 ([10.239.160.21])
 by FMSMGA003.fm.intel.com with ESMTP; 11 Apr 2019 18:35:04 -0700
Subject: Re: [PATCH V2 4/6] drm/i915/gvt: Check if cur_pt_type is valid
To: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>,
 intel-gvt-dev@lists.freedesktop.org
References: <20190411104631.7627-1-aleksei.gimbitskii@intel.com>
 <20190411104631.7627-5-aleksei.gimbitskii@intel.com>
From: Colin Xu <Colin.Xu@intel.com>
Message-ID: <c1024ddc-8173-375e-affd-122eb7a6c89b@intel.com>
Date: Fri, 12 Apr 2019 09:35:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190411104631.7627-5-aleksei.gimbitskii@intel.com>
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
Cc: Zhi Wang <zhi.a.wang@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Ck9uIDIwMTktMDQtMTEgMTg6NDYsIEFsZWtzZWkgR2ltYml0c2tpaSB3cm90ZToKPiBTdGF0aWMg
Y29kZSBhbmFseXplciB3YXJucyB0aGF0IGluZGV4IHZhbHVlIGZvciBzY3JhdGNoX3B0IG1heSBi
ZSBlcXVhbAo+IHRvIC0xLiBJbmRleCB2YWx1ZSB0eXBlIGlzIGludGVsX2d2dF9ndHRfdHlwZV90
LCBzbyBpdCBtYXkgYmUgYW55IG51bWJlcgo+IGF0IHJhbmdlIC0xIHRvIDE3LiBDaGVjayBmaXJz
dCBpZiBjdXJfcHRfdHlwZSBhbmQgY3VyX3B0X3R5cGUrMSBpcyB2YWxpZAo+IHZhbHVlcy4KPgo+
IHYyOgo+ICAgLSBQcmludCBzb21lIGVycm9yIG1lc3NhZ2VzIGlmIHBhZ2UgdGFibGUgdHlwZSBp
cyBpbnZhbGlkLiAoQ29saW4gWHUpCj4KPiBUaGlzIHBhdGNoIGZpeGVkIHRoZSBjcml0aWFsIGlz
c3VlICM0MjIgcmVwb3J0ZWQgYnkga2xvY3dvcmsuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbGVrc2Vp
IEdpbWJpdHNraWkgPGFsZWtzZWkuZ2ltYml0c2tpaUBpbnRlbC5jb20+Cj4gQ2M6IFpoZW55dSBX
YW5nIDx6aGVueXV3QGxpbnV4LmludGVsLmNvbT4KPiBDYzogWmhpIFdhbmcgPHpoaS5hLndhbmdA
aW50ZWwuY29tPgo+IENjOiBDb2xpbiBYdSA8Y29saW4ueHVAaW50ZWwuY29tPgo+IC0tLQo+ICAg
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jIHwgMTEgKysrKysrKysrKy0KPiAgIDEgZmls
ZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z3Z0L2d0dC5jCj4gaW5kZXggOGRjYjYyMjNiOTg1Li5lNDRkZGIzMjhiNGIgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Z0L2d0dC5jCj4gQEAgLTkzNiw3ICs5MzYsMTYgQEAgc3RhdGljIGludCBwcGd0dF9p
bnZhbGlkYXRlX3NwdF9ieV9zaGFkb3dfZW50cnkoc3RydWN0IGludGVsX3ZncHUgKnZncHUsCj4g
ICAKPiAgIAlpZiAoZS0+dHlwZSAhPSBHVFRfVFlQRV9QUEdUVF9ST09UX0wzX0VOVFJZCj4gICAJ
CSYmIGUtPnR5cGUgIT0gR1RUX1RZUEVfUFBHVFRfUk9PVF9MNF9FTlRSWSkgewo+IC0JCWN1cl9w
dF90eXBlID0gZ2V0X25leHRfcHRfdHlwZShlLT50eXBlKSArIDE7Cj4gKwkJY3VyX3B0X3R5cGUg
PSBnZXRfbmV4dF9wdF90eXBlKGUtPnR5cGUpOwo+ICsKPiArCQlpZiAoIWd0dF90eXBlX2lzX3B0
KGN1cl9wdF90eXBlKSB8fAo+ICsJCQkJIWd0dF90eXBlX2lzX3B0KGN1cl9wdF90eXBlICsgMSkp
IHsKPiArCQkJV0FSTigxLCAiSW52YWxpZCBwYWdlIHRhYmxlIHR5cGVcbiIpOwpJdCB3aWxsIGJl
IGJldHRlciBpZiBpbmNsdWRlIGN1cl9wdF90eXBlIGluIHRoZSB3YXJuaW5nLgo+ICsJCQlyZXR1
cm4gLUVJTlZBTDsKPiArCQl9Cj4gKwo+ICsJCWN1cl9wdF90eXBlICs9IDE7Cj4gKwo+ICAgCQlp
ZiAob3BzLT5nZXRfcGZuKGUpID09Cj4gICAJCQl2Z3B1LT5ndHQuc2NyYXRjaF9wdFtjdXJfcHRf
dHlwZV0ucGFnZV9tZm4pCj4gICAJCQlyZXR1cm4gMDsKCi0tIApCZXN0IFJlZ2FyZHMsCkNvbGlu
IFh1CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRl
bC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2
dC1kZXY=
