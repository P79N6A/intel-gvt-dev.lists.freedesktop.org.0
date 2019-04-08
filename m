Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp3096906ywo;
        Mon, 8 Apr 2019 00:33:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxi3nfQNHKAcVymBPuqLhDxyikbFbR7nMOt/YsslvlyjKg5RcgrPRx7l1e/BlpA9tULU5n7
X-Received: by 2002:a65:4183:: with SMTP id a3mr27615885pgq.121.1554708798865;
        Mon, 08 Apr 2019 00:33:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554708798; cv=none;
        d=google.com; s=arc-20160816;
        b=XZVxO4l3vN0ev8lLuF4PRxlBH2J8PI7ZpeygTECP0KbP3RueEu/lya2WuSHKvqCceA
         kEZd7Kt352otrDHpBfTsJXuJLvQdQZtsRzWz4+zbZdZtGPFjmCs9Q3kb8hCu80dqOtV/
         QqZ7HafIViWiFoSAmncGkH4jSvBAnsZWhxcxviJNejvFbG4YgLJ4r6BXoeobBx921CA0
         h5i3vSfK0jCKgEFaVx/5UP3jxrgiWc9NZoyTlCcY+QgvFWVMRtOVTi/92U8OC+7+75jT
         JBtyd4LeP1kj3AtcezG6SNvD/4+PuiFxcjC6zzor5d89hUool47CKoDI54K+AictSlSv
         usgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:reply-to
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject:delivered-to;
        bh=vOWvjQJTy2h44NRr4X7GQh8AeMs+k0X7jTRoJC9wsZ0=;
        b=pg4/AAplA/JaVYZuN2V6zkYQsQAqR/u7o/3qhP29Wd0eWPp6CM6wvRdWNr6CUovOc8
         wa7TnCpyv/baGcFExP2S6lenLr5mxXOKwvz/USbORXN2hYS9kzVtJtv/eOoE3Upp4dVp
         tqpVcf55dGcCkFq7IqX2r5en8SKSZAJgzyNA0F4lBLfu0xcEMjarDnXZ08Q4ZlJvKmoA
         oCcy7DpPcd6s3ZaAxhGe09BDHPjtCgFBFeOT9ynQQxOf+fed73mcq3V9UPQ2I87hylPy
         z+bKk67ursB3q/Twblb40Oi0hFTv/wO7QAPExolByUcWE4HOANxlRBLzyWsYbc5i6UMa
         Iohw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id z7si24998773pgu.546.2019.04.08.00.33.18
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Apr 2019 00:33:18 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A4BC895C1;
	Mon,  8 Apr 2019 07:33:18 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C869895C1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  8 Apr 2019 07:33:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Apr 2019 00:33:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,324,1549958400"; d="scan'208";a="313996481"
Received: from coxu-arch-shz.sh.intel.com (HELO [10.239.160.21])
 ([10.239.160.21])
 by orsmga005.jf.intel.com with ESMTP; 08 Apr 2019 00:33:13 -0700
Subject: Re: [PATCH 5/5] drm/i915/gvt: Assign NULL to the pointer after memory
 free.
To: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>,
 intel-gvt-dev@lists.freedesktop.org
References: <20190408055502.8474-1-aleksei.gimbitskii@intel.com>
 <20190408055502.8474-5-aleksei.gimbitskii@intel.com>
From: Colin Xu <Colin.Xu@intel.com>
Message-ID: <71a822d3-de84-44b0-0f35-b9bcb9f5914a@intel.com>
Date: Mon, 8 Apr 2019 15:33:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190408055502.8474-5-aleksei.gimbitskii@intel.com>
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
Cc: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Ck9uIDIwMTktMDQtMDggMTM6NTUsIEFsZWtzZWkgR2ltYml0c2tpaSB3cm90ZToKPiBUaGUga2xv
Y3dvcmsgc3RhdGljIGNvZGUgYW5hbHl6ZXIgY29tcGxhaW5zIGFib3V0IHVzaW5nIHBvaW50ZXIg
YWZ0ZXIKPiBiZWluZyBmcmVlZCwgYmVjYXVzZSBmdXJ0aGVyIHdlIHBhc3MgaXQgdG8gdGhlIGd2
dF92Z3B1X2VycigpIGZ1bmN0aW9uLgo+IEFzc2lnbiBwb2ludGVyIHRvIGJlIE5VTEwgaW50ZW50
aW9uYWx5LCB0byBtZWV0IHJlcXVpcmVtZW50cyBvZiB0aGUgY29kZQo+IGFuYWx5emVyLgo+Cj4g
VGhpcyBwYXRjaCBmaXhlZCB0aGUgaXNzdWUgIzY0OCByZXBvcnRlZCBhcyBlcnJvciBieSBrbG9j
d29yay4KPgo+IFNpZ25lZC1vZmYtYnk6IEFsZWtzZWkgR2ltYml0c2tpaSA8YWxla3NlaS5naW1i
aXRza2lpQGludGVsLmNvbT4KPiBDYzogWmhlbnl1IFdhbmcgPHpoZW55dXdAbGludXguaW50ZWwu
Y29tPgo+IENjOiBaaGkgV2FuZyA8emhpLmEud2FuZ0BpbnRlbC5jb20+Cj4gLS0tCj4gICBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMgfCAxICsKPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQu
YyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYwo+IGluZGV4IDdkYzA5YjM4OWU1OS4u
M2NmMzk4NGFhZTQxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQu
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYwo+IEBAIC0xMDk4LDYgKzEw
OTgsNyBAQCBzdGF0aWMgc3RydWN0IGludGVsX3ZncHVfcHBndHRfc3B0ICpwcGd0dF9wb3B1bGF0
ZV9zcHRfYnlfZ3Vlc3RfZW50cnkoCj4gICAKPiAgIGVycl9mcmVlX3NwdDoKPiAgIAlwcGd0dF9m
cmVlX3NwdChzcHQpOwo+ICsJc3B0ID0gTlVMTDsKCkxvZ2ljYWxseSBpdCdzIG9rIHRvIGV4cGxp
Y2l0IHNldCBzcHQgdG8gTlVMTC4gSG93ZXZlciBmcm9tIGRlYnVnIHB1cnBvc2UgbGFiZWwgImVy
cl9mcmVlX3NwdCIKaXMganVtcGVkIHRvIGR1ZSB0byBmYWlsdXJlIG9mIGludGVsX3ZncHVfZW5h
YmxlX3BhZ2VfdHJhY2sgb3IgcHBndHRfcG9wdWxhdGVfc3B0LCBub3Qgc2FtZSBhcwpsYWJlbCAi
ZXJyIi4gSXQncyBiZXR0ZXIgdG8gbWFrZSBkYmdtc2cgbW9yZSBjbGVhciBhYm91dCB3aGljaCBz
cHQgZmFpbHMgaW4gc3VjaCBjYXNlIHNvIHRoYXQKdGhlIGxpZmVjeWNsZSBvZiBhIHNwdCBpbiBk
Ymdtc2cgaXMgbW9yZSBjbGVhciBmb3IgZGlmZmVyZW50IHNpdHVhdGlvbnMuCgo+ICAgZXJyOgo+
ICAgCWd2dF92Z3B1X2VycigiZmFpbDogc2hhZG93IHBhZ2UgJXAgZ3Vlc3QgZW50cnkgMHglbGx4
IHR5cGUgJWRcbiIsCj4gICAJCSAgICAgc3B0LCB3ZS0+dmFsNjQsIHdlLT50eXBlKTsKCi0tIApC
ZXN0IFJlZ2FyZHMsCkNvbGluIFh1CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
