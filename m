Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp6774030ywo;
        Thu, 11 Apr 2019 04:19:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxh/IQ/Tw14YVfLck2X02/kC5FvgfLjwH4fMydGdGGJpEOjBCEVERYJHeMq/BHBCOh2g4J4
X-Received: by 2002:a17:902:7c01:: with SMTP id x1mr23984739pll.299.1554981595788;
        Thu, 11 Apr 2019 04:19:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554981595; cv=none;
        d=google.com; s=arc-20160816;
        b=M+5N5u434izLzip6s0VPDe8e+trMXRPrfLAhCU4d8fzq93iqEyJmhmxjV1rm4RpS5f
         fKkePlVPQ+V+Ma5d+9CPaE7XnDFgEz8c/9PUiPV1+dIBgUdfAY5hcffdk45bIbySA8GW
         pw4A0caQzLs7rp5sDk8nPSKvLUXLl0aNaYyJqypu/z3ynYBBBsQB9S2X0EoNxl8xb12R
         o3R5uBbkLweCYg8RHiSHjC+K/luJXp8DWB/tIJ4H4tXK0UVyvfRfE1ViOUeLwkL/wHBa
         bZ/9kuqk/LIqbP9fpJXoFSUS0Me4/1mQiUkuIfR0PgQsJ5IF3SODw9/VonnloHtXv1m8
         y8mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:dlp-reaction:dlp-version:dlp-product
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:to:from:delivered-to;
        bh=DEHo2EJGY7TpIUxHqlJDk2UOLqNYdcqPp0OJLpApLiE=;
        b=O8unnZ9cVRcFIq00wWmZcldjLRCPsUoibGBkB8QrQf1KyriNZ6+X/gyt7tF/Ddud8A
         flXBSscF65pV+lya86IFO6n8SGzQ2LG8ZWJI2oYSFK6wwUdF+lfUvRpFzBMszjv2gs8i
         RMHr1Mx1q9XihHbF4xh8ZnB98VUG+wIcYLTchCUl8raehb+2IW+fwmEoeXn8AZqzmYlZ
         EOCfwD02ef0imp5nyfubjq6WwLXu3m+uK3xuxYy0APU9JOzgEdw2Dd1SnrczN+oapGKh
         PW2sxIIANs67uyK5++ayzvZulME0WkNH7O70tD0b7E1fHgh9o3QTzhyrW8tckzHueyem
         yAOw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id a68si2937951pla.60.2019.04.11.04.19.54
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2019 04:19:55 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0EE989471;
	Thu, 11 Apr 2019 11:19:54 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AD7589471
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 11 Apr 2019 11:19:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Apr 2019 04:19:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,337,1549958400"; d="scan'208";a="130463773"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
 by orsmga007.jf.intel.com with ESMTP; 11 Apr 2019 04:19:50 -0700
Received: from irsmsx112.ger.corp.intel.com (10.108.20.5) by
 IRSMSX103.ger.corp.intel.com (163.33.3.157) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 11 Apr 2019 12:19:49 +0100
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.31]) by
 irsmsx112.ger.corp.intel.com ([169.254.1.101]) with mapi id 14.03.0415.000;
 Thu, 11 Apr 2019 12:19:49 +0100
From: "Gimbitskii, Aleksei" <aleksei.gimbitskii@intel.com>
To: "Xu, Colin" <colin.xu@intel.com>, "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>
Subject: RE: [PATCH 3/5] drm/i915/gvt: Use snprintf() to prevent possible
 buffer overflow.
Thread-Topic: [PATCH 3/5] drm/i915/gvt: Use snprintf() to prevent possible
 buffer overflow.
Thread-Index: AQHU7dAMY+BdqO6xYUS/es5qiF4RmqYxyb2AgAUK63A=
Date: Thu, 11 Apr 2019 11:19:48 +0000
Message-ID: <1EB9BA72F2F5144BB1A5812E11248EAD18E12A56@irsmsx105.ger.corp.intel.com>
References: <20190408055502.8474-1-aleksei.gimbitskii@intel.com>
 <20190408055502.8474-3-aleksei.gimbitskii@intel.com>
 <79807cd1-7da0-a79a-885f-ea4c466d209d@intel.com>
In-Reply-To: <79807cd1-7da0-a79a-885f-ea4c466d209d@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNjZmY2IzMjAtNzNiMS00OWFlLTgxNTYtMTNjZDRhNjVkYTBlIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiWmRLeHpJaHFDSlpIalN0SjQxdTJldUprVE15U3FJSmM1QXhWaDk5ZzBWZjNQMlF3XC9pU2VLZWRLQVZmdkswTzAifQ==
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
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
Cc: "Wang, Zhi A" <zhi.a.wang@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VGhhbmtzIGZvciB5b3VyIHJldmlldy4gVGhlIGJ1ZmZlciBpbiBuZXcgcGF0Y2ggdmVyc2lvbiBp
cyBpbmNyZWFzZWQuDQoNCkJSLCBBbGVrc2VpLg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KRnJvbTogaW50ZWwtZ3Z0LWRldiBbbWFpbHRvOmludGVsLWd2dC1kZXYtYm91bmNlc0BsaXN0
cy5mcmVlZGVza3RvcC5vcmddIE9uIEJlaGFsZiBPZiBDb2xpbiBYdQ0KU2VudDogTW9uZGF5LCBB
cHJpbCA4LCAyMDE5IDEwOjE3IEFNDQpUbzogR2ltYml0c2tpaSwgQWxla3NlaSA8YWxla3NlaS5n
aW1iaXRza2lpQGludGVsLmNvbT47IGludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
DQpDYzogWmhlbnl1IFdhbmcgPHpoZW55dXdAbGludXguaW50ZWwuY29tPjsgV2FuZywgWmhpIEEg
PHpoaS5hLndhbmdAaW50ZWwuY29tPg0KU3ViamVjdDogUmU6IFtQQVRDSCAzLzVdIGRybS9pOTE1
L2d2dDogVXNlIHNucHJpbnRmKCkgdG8gcHJldmVudCBwb3NzaWJsZSBidWZmZXIgb3ZlcmZsb3cu
DQoNCg0KT24gMjAxOS0wNC0wOCAxMzo1NSwgQWxla3NlaSBHaW1iaXRza2lpIHdyb3RlOg0KPiBG
b3IgcHJpbnRpbmcgdGhlIGludGVsX3ZncHUtPmlkLCBhIGJ1ZmZlciB3aXRoIGZpeGVkIGxlbmd0
aCBpcyANCj4gYWxsb2NhdGVkIG9uIHRoZSBzdGFjay4gQnV0IGlmIHZncHUtPmlkIGlzIGdyZWF0
ZXIgdGhhbiA2IGNoYXJhY3RlcnMsIA0KPiB0aGUgYnVmZmVyIG92ZXJmbG93IHdpbGwgaGFwcGVu
LiBFdmVuIHRoZSBzdHJpbmcgb2YgdGhlIGFtb3VudCBvZiBtYXggDQo+IHZncHUgaXMgbGVzcyB0
aGF0IHRoZSBsZW5ndGggYnVmZmVyIHJpZ2h0IG5vdywgaXQncyBiZXR0ZXIgdG8gcmVwbGFjZSAN
Cj4gc3ByaW50ZigpIHdpdGggc25wcmludGYoKS4NCj4NCj4gVGhpcyBwYXRjaCBmaXhlZCB0aGUg
Y3JpdGljYWwgaXNzdWUgIzY3MyByZXBvcnRlZCBieSBrbG9jd29yay4NCj4NCj4gU2lnbmVkLW9m
Zi1ieTogQWxla3NlaSBHaW1iaXRza2lpIDxhbGVrc2VpLmdpbWJpdHNraWlAaW50ZWwuY29tPg0K
PiBDYzogWmhlbnl1IFdhbmcgPHpoZW55dXdAbGludXguaW50ZWwuY29tPg0KPiBDYzogWmhpIFdh
bmcgPHpoaS5hLndhbmdAaW50ZWwuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndnQvZGVidWdmcy5jIHwgMiArLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z3Z0L2RlYnVnZnMuYyANCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZGVidWdmcy5jDQo+
IGluZGV4IDJlYzg5YmNiNTlmMS4uNTFiMjcwNTAxOGQ1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndnQvZGVidWdmcy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC9kZWJ1Z2ZzLmMNCj4gQEAgLTE5OCw3ICsxOTgsNyBAQCBpbnQgaW50ZWxfZ3Z0X2RlYnVn
ZnNfYWRkX3ZncHUoc3RydWN0IGludGVsX3ZncHUgKnZncHUpDQo+ICAgCXN0cnVjdCBkZW50cnkg
KmVudDsNCj4gICAJY2hhciBuYW1lWzEwXSA9ICIiOw0KPiAgIA0KPiAtCXNwcmludGYobmFtZSwg
InZncHUlZCIsIHZncHUtPmlkKTsNCj4gKwlzbnByaW50ZihuYW1lLCAxMCwgInZncHUlZCIsIHZn
cHUtPmlkKTsNCg0KU2VjdXJlIGZ1bmN0aW9uIGxpa2Ugc25wcmludGYgaXMgYWx3YXlzIHByZWZl
cnJlZCBvdmVyIG5vbi1zZWN1cmUgdmFyaWFudHMuDQpDdXJyZW50IGltcGxlbWVudGF0aW9uIGRl
ZmluZXMgaW50ZWxfdmdwdS0+aWQgYXMgaW50LCB3aGljaCBpbmRpY2F0ZXMgYWx0aG91Z2gNCnR5
cGU4IGlzIHRoZSBtYXggbnVtYmVyIG9mIHZncHUgdGhhdCBndnQgYWxsb3dzLCB3ZSBjb3VsZCBp
bmNyZWFzZSB1cCBsaW1pdCB0byBtb3JlIHRoYW4gOC4gSW4gdGhhdCBjYXNlIGJ1ZiBzaXplIG9m
IDEwIHdpbGwgYmUgaW5zdWZmaWNpZW50Lg0KSW4gYWRkaXRpb24gdG8gdXNlIHNucHJpbnRmLCBp
dCB3aWxsIGJlIGJldHRlciB0byBpbmNyZWFzZSB0aGUgYnVmIHNpemUgdGhhdCBjb3VsZCBob2xk
IG1heCBwb3NzaWJsZSB2YWx1ZSBvZiBpbnRlbF92Z3B1LT5pZCB0eXBlLg0KDQo+ICAgCXZncHUt
PmRlYnVnZnMgPSBkZWJ1Z2ZzX2NyZWF0ZV9kaXIobmFtZSwgdmdwdS0+Z3Z0LT5kZWJ1Z2ZzX3Jv
b3QpOw0KPiAgIAlpZiAoIXZncHUtPmRlYnVnZnMpDQo+ICAgCQlyZXR1cm4gLUVOT01FTTsNCg0K
LS0NCkJlc3QgUmVnYXJkcywNCkNvbGluIFh1DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fDQppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdA0KaW50ZWwt
Z3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkludGVsIEZp
bmxhbmQgT3kKUmVnaXN0ZXJlZCBBZGRyZXNzOiBQTCAyODEsIDAwMTgxIEhlbHNpbmtpIApCdXNp
bmVzcyBJZGVudGl0eSBDb2RlOiAwMzU3NjA2IC0gNCAKRG9taWNpbGVkIGluIEhlbHNpbmtpIAoK
VGhpcyBlLW1haWwgYW5kIGFueSBhdHRhY2htZW50cyBtYXkgY29udGFpbiBjb25maWRlbnRpYWwg
bWF0ZXJpYWwgZm9yCnRoZSBzb2xlIHVzZSBvZiB0aGUgaW50ZW5kZWQgcmVjaXBpZW50KHMpLiBB
bnkgcmV2aWV3IG9yIGRpc3RyaWJ1dGlvbgpieSBvdGhlcnMgaXMgc3RyaWN0bHkgcHJvaGliaXRl
ZC4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkCnJlY2lwaWVudCwgcGxlYXNlIGNvbnRhY3Qg
dGhlIHNlbmRlciBhbmQgZGVsZXRlIGFsbCBjb3BpZXMuCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVs
LWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
