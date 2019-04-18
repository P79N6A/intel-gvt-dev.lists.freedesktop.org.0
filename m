Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp64514ywo;
        Wed, 17 Apr 2019 18:28:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzisyv2Y2vnVFFtjrh68ic1zmwoROQ8KSeMCnqS/URWGTouIqaUzeYY7DXeWkWdO+7LzlHb
X-Received: by 2002:a63:c64a:: with SMTP id x10mr81096273pgg.12.1555550920768;
        Wed, 17 Apr 2019 18:28:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555550920; cv=none;
        d=google.com; s=arc-20160816;
        b=ItER8E0QvcYW6E5H4XWmZB8x44sm40AgevcWH1UocVGdu41es4VaBSlLwDI3EXVyhG
         IFo8qk4iVilt0Hf3bxivilMJ3X25s7942ewVYq7Wy5tFgZJvn2GHXWXf6+dSBoDkftc3
         rtSb1jeLqlyPP1hMtaRoRmg8wU8LUaLBRPWx6c1YllyykzcfZ44mIr2hrwATzFvjUVF+
         xv9fm6rnw55nN5bpmM4ufRzp3j+gaz02LGU66IqHsB58cplYgQ4bxPxsi5TCiBibON4m
         0JxgRExxtNjmn3/OuHdg557gWNzbSwjI1R6Y5YG3iVBbRDU1+Gf6Xxv/Q7gwdOAyl5DY
         +z+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence
         :mime-version:dlp-reaction:dlp-version:dlp-product:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:delivered-to;
        bh=5c+VahhkPMd0FZr3UP5d2ZcCqhVbjAyy1YaLm037RPc=;
        b=L6UX6BJ/0RJ7Igf1TonxX5Tafb6pvlxDAkvebcMFTBD84KMP+qz14bPhdQHstsHexS
         PfjHaTf4VZ/SU92if0Uu/ool23XwmOo+7FiF5eG/CJB2EhlC0ZNzx87qcPfglvmxsITc
         wLUB5+Uqs4Kc1REpQP880VpaIeb9SVLPuQ/xdhHcqoC7sik5M0YUUUV+TI/1PWrZo9JQ
         oITqb60WkSSF/rxv0RZtHjeNK4QAdmOjV362qJpDdXqsV1KwaMIRiUjGczZIJBEEu8rv
         ugfWTWKiGdMe1kSbPxW0SYHvu6T8Nt2EfELLtuzim41hWbPdNRIyUFv0yAGINWjs8BDh
         fZug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id u8si480033pgo.122.2019.04.17.18.28.39
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Apr 2019 18:28:40 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C08096E0B8;
	Thu, 18 Apr 2019 01:28:39 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 937686E0B8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 18 Apr 2019 01:28:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Apr 2019 18:28:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,364,1549958400"; d="scan'208";a="143644431"
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
 by orsmga003.jf.intel.com with ESMTP; 17 Apr 2019 18:28:36 -0700
Received: from fmsmsx121.amr.corp.intel.com (10.18.125.36) by
 fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 17 Apr 2019 18:28:36 -0700
Received: from shsmsx102.ccr.corp.intel.com (10.239.4.154) by
 fmsmsx121.amr.corp.intel.com (10.18.125.36) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 17 Apr 2019 18:28:36 -0700
Received: from shsmsx103.ccr.corp.intel.com ([169.254.4.93]) by
 shsmsx102.ccr.corp.intel.com ([169.254.2.206]) with mapi id 14.03.0415.000;
 Thu, 18 Apr 2019 09:28:33 +0800
From: "He, Min" <min.he@intel.com>
To: "hang.yuan@linux.intel.com" <hang.yuan@linux.intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915/gvt: remove call trace in plane scaling handler
Thread-Topic: [PATCH] drm/i915/gvt: remove call trace in plane scaling handler
Thread-Index: AQHU9QtEX5DPWN9J3UypLP18pyQ2EqZBIMUg
Date: Thu, 18 Apr 2019 01:28:33 +0000
Message-ID: <B8F3B07A09E6B84F88EAD83F055E9945519F6099@SHSMSX103.ccr.corp.intel.com>
References: <1555497634-8596-1-git-send-email-hang.yuan@linux.intel.com>
In-Reply-To: <1555497634-8596-1-git-send-email-hang.yuan@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZDY3YjIzYTgtMWJiYy00YzdjLWFhMDAtNTM3ZDE5MDRmZDI0IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiNFBCU2tWc0EyekMwelp5dndJRXkxUGkxSHAyNzgwUFwvb1hZMlZIZEJXWEhWZTRwaHdydmt1RkRXQ3lrYWxrc2UifQ==
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

SGVucnksDQpXaGVuIGd1ZXN0IGlzIHRyeWluZyB0byB1c2UgdGhlIHBsYW5lIHNjYWxlciwgaXQg
d2lsbCB3cml0ZSB0byB0aGUgUFNfQ1RSTCByZWdpc3Rlcg0Kb24gZXZlcnkgcGxhbmUgdXBkYXRl
LiBBbmQgd2UgZG9u4oCZdCBoYXZlIG1lY2hhbmlzbXMgdG8gbm90aWZ5IHRoZSBndWVzdCB0aGF0
DQpzY2FsZXIgaXMgbm90IGF2YWlsYWJsZS4gU28gaWYgeW91IG1vZGlmeSBpdCB0byBndnRfdmdw
dV9lcnIoKSwgaXQgd2lsbCBjYXVzZSBtYXNzaXZlDQpkbWVzZyBsb2dzIGluIGRvbTAsIHdoYXQn
cyB3aHkgd2UgdXNlZCBXQVJOX09OX09OQ0UoKSB0byBsb2cgaXQuDQoNClRoYW5rcy4NCg0KPiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBpbnRlbC1ndnQtZGV2IFttYWlsdG86
aW50ZWwtZ3Z0LWRldi1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZ10gT24NCj4gQmVoYWxm
IE9mIGhhbmcueXVhbkBsaW51eC5pbnRlbC5jb20NCj4gU2VudDogV2VkbmVzZGF5LCBBcHJpbCAx
NywgMjAxOSA2OjQxIFBNDQo+IFRvOiBpbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zw0KPiBDYzogSGFuZyBZdWFuIDxoYW5nLnl1YW5AbGludXguaW50ZWwuY29tPg0KPiBTdWJqZWN0
OiBbUEFUQ0hdIGRybS9pOTE1L2d2dDogcmVtb3ZlIGNhbGwgdHJhY2UgaW4gcGxhbmUgc2NhbGlu
ZyBoYW5kbGVyDQo+IA0KPiBGcm9tOiBIYW5nIFl1YW4gPGhhbmcueXVhbkBsaW51eC5pbnRlbC5j
b20+DQo+IA0KPiBPbiBndWVzdCBNTUlPIGFjY2VzcyB0byBzY2FsZSBhIHBsYW5lLCBwcmludCBt
ZXNzYWdlIGJ1dCBubw0KPiBjYWxsIHRyYWNlIGR1bXBlZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IEhhbmcgWXVhbiA8aGFuZy55dWFuQGxpbnV4LmludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYyB8IDMgKy0tDQo+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dnQvaGFuZGxlcnMuYw0KPiBpbmRleCAxOGYwMWVlLi5kM2Q2Nzg4IDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndnQvaGFuZGxlcnMuYw0KPiBAQCAtMTI5OCw4ICsxMjk4LDcgQEAgc3RhdGljIGlu
dCBwZl93cml0ZShzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwNCj4gIAlpZiAoKG9mZnNldCA9PSBf
UFNfMUFfQ1RSTCB8fCBvZmZzZXQgPT0gX1BTXzJBX0NUUkwgfHwNCj4gIAkgICBvZmZzZXQgPT0g
X1BTXzFCX0NUUkwgfHwgb2Zmc2V0ID09IF9QU18yQl9DVFJMIHx8DQo+ICAJICAgb2Zmc2V0ID09
IF9QU18xQ19DVFJMKSAmJiAodmFsICYgUFNfUExBTkVfU0VMX01BU0spICE9IDApIHsNCj4gLQkJ
V0FSTl9PTkNFKHRydWUsICJWTSglZCk6IGd1ZXN0IGlzIHRyeWluZyB0byBzY2FsaW5nIGENCj4g
cGxhbmVcbiIsDQo+IC0JCQkgIHZncHUtPmlkKTsNCj4gKwkJZ3Z0X3ZncHVfZXJyKCJ1bnN1cHBv
cnRlZCBkaXNwbGF5IHBsYW5lIHNjYWxpbmcNCj4gb3BlcmF0aW9uXG4iKTsNCj4gIAkJcmV0dXJu
IDA7DQo+ICAJfQ0KPiANCj4gLS0NCj4gMi43LjQNCj4gDQo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IGludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0
DQo+IGludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IGh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWls
aW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
