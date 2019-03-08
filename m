Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp7710181ywe;
        Thu, 7 Mar 2019 23:30:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqzmFEL5EBnX1W2je3qi77LKUrI4jHyQo36oFCkDgmWoZNb1ZoOEhlX/UCiTR6lLO28z43MY
X-Received: by 2002:a17:902:42d:: with SMTP id 42mr17762116ple.229.1552030248671;
        Thu, 07 Mar 2019 23:30:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552030248; cv=none;
        d=google.com; s=arc-20160816;
        b=F+mawpWWNJCoZJjwbdhuxIFc6gDFk/q5M0BEyPKXDTrsNSykLp3K/l67l2+PTtA/Qk
         4pxZniSEguIF/jtk4KC2wsgdX7EpM5oMtrEsy1h9roD8I+NUHEdi2cXysvLMTIxGB0WF
         NF88Ne8nbWsHU0ElIhWX7ff5b5YL+GoWhs3Jc2HenKEeAuTBx3mW2o4PHcvJeUxusNdC
         8Xui6Thj+sO5EZchyCuQWUE4k/5jKP80LHrUxPsGQ4fIuOP0YLG9n3hDxvY4ypt90dmJ
         fqk8dSmg/D+FBJo/ffQaHAEb4ohUwa7Q7ihn5oGnzxDUhBQwpAaTuRfRr/fOY7pskDq1
         D6fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence
         :mime-version:dlp-reaction:dlp-version:dlp-product:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:delivered-to;
        bh=1nBswYegwHYB6udD63D/iaNspYYYGLpGaE4gRNVBQi8=;
        b=qBKTgzWhvjBpwrGUSW3ZBrCp+balgBZDtu0fDYhXETNpzad29GEuSXKwP27H1ATHRb
         +EWqwYmsNLLJsq3f5TM7ERPkGL8id8OKeN0kwBa49nGsuXZKhQsZSlCnWWXCMeZicH9b
         QO4Rwn4UbVIDaPMGVvpUA/1913umzs7ium1ArXSVvxFsvLk0aiazkZMzPpGWtgGKzMNU
         sEox25VjmiwEToQxaqGWyCePYgBZBOCqjTGNbLg0Cf6cutIKUMOFHWMpPOpsHcY6sW6e
         52gOxzn+TXz3ieFIew3APvHs9KjgGbrdKjYxk8ZZJp1LNjQ0K55A4FPBwORhluZVj60P
         7oKA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id 193si5852985pgc.365.2019.03.07.23.30.48
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Mar 2019 23:30:48 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4343A89338;
	Fri,  8 Mar 2019 07:30:48 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 176B189338
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  8 Mar 2019 07:30:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Mar 2019 23:30:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,455,1544515200"; d="scan'208";a="122264195"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by orsmga006.jf.intel.com with ESMTP; 07 Mar 2019 23:30:46 -0800
Received: from fmsmsx112.amr.corp.intel.com (10.18.116.6) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 7 Mar 2019 23:30:45 -0800
Received: from shsmsx154.ccr.corp.intel.com (10.239.6.54) by
 FMSMSX112.amr.corp.intel.com (10.18.116.6) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 7 Mar 2019 23:30:45 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.74]) by
 SHSMSX154.ccr.corp.intel.com ([169.254.7.223]) with mapi id 14.03.0415.000;
 Fri, 8 Mar 2019 15:30:43 +0800
From: "Zhao, Yan Y" <yan.y.zhao@intel.com>
To: "He, Min" <min.he@intel.com>, "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915/gvt: remove the unused sreg
Thread-Topic: [PATCH] drm/i915/gvt: remove the unused sreg
Thread-Index: AQHU1X8QwY4O2gkt60emKE35tS6tgKYAzoOAgACIC0A=
Date: Fri, 8 Mar 2019 07:30:42 +0000
Message-ID: <F22B14EC3CFBB843AD3E03B6B78F2C6A4ADE7EF7@SHSMSX104.ccr.corp.intel.com>
References: <20190308071220.20202-1-yan.y.zhao@intel.com>
 <B8F3B07A09E6B84F88EAD83F055E9945519CB29A@SHSMSX103.ccr.corp.intel.com>
In-Reply-To: <B8F3B07A09E6B84F88EAD83F055E9945519CB29A@SHSMSX103.ccr.corp.intel.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZmZlMDMxMTgtNzk1MC00NzU2LWFjNWQtYzFkYWVmYWQyOGEzIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoid1kwRHd5UUhkaVV5XC9OUzZ3RUlSaEN2VkdCMUhhd0RzYnhmeGlJV2d5SmJYK3dXQThTMWNHVlhMWGRhQmtvclEifQ==
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
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

UmlnaHQsIGp1c3QgYWJvdXQgdG8gcGF0Y2ggdGhhdCA6KQ0KdGhhbmtzDQoNCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSGUsIE1pbg0KPiBTZW50OiBGcmlkYXksIE1hcmNo
IDgsIDIwMTkgMzoyMyBQTQ0KPiBUbzogWmhhbywgWWFuIFkgPHlhbi55LnpoYW9AaW50ZWwuY29t
PjsgaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IFpoYW8sIFlhbiBZ
IDx5YW4ueS56aGFvQGludGVsLmNvbT4NCj4gU3ViamVjdDogUkU6IFtQQVRDSF0gZHJtL2k5MTUv
Z3Z0OiByZW1vdmUgdGhlIHVudXNlZCBzcmVnDQo+IA0KPiANCj4gDQo+ID4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBpbnRlbC1ndnQtZGV2DQo+ID4gW21haWx0bzppbnRl
bC1ndnQtZGV2LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnXSBPbiBCZWhhbGYgT2YgWWFu
DQo+ID4gWmhhbw0KPiA+IFNlbnQ6IEZyaWRheSwgTWFyY2ggOCwgMjAxOSAzOjEyIFBNDQo+ID4g
VG86IGludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4gQ2M6IFpoYW8sIFlh
biBZIDx5YW4ueS56aGFvQGludGVsLmNvbT4NCj4gPiBTdWJqZWN0OiBbUEFUQ0hdIGRybS9pOTE1
L2d2dDogcmVtb3ZlIHRoZSB1bnVzZWQgc3JlZw0KPiA+DQo+ID4gY29kZSBjbGVhbnVwLiBzcmVn
IGlzIG5vdCB1c2VkIG5vdy4gcmVtb3ZlIGl0IGZvciBjb2RlIGNsZWFubmVzcy4NCj4gPg0KPiA+
IFNpZ25lZC1vZmYtYnk6IFlhbiBaaGFvIDx5YW4ueS56aGFvQGludGVsLmNvbT4NCj4gPiAtLS0N
Cj4gPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d2dC5oICAgICAgfCA1IC0tLS0tDQo+ID4g
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9oYW5kbGVycy5jIHwgNSArLS0tLQ0KPiA+ICBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvbW1pby5jICAgICB8IDYgKy0tLS0tDQo+ID4gIDMgZmlsZXMg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3Z0LmgNCj4gPiBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d2dC9ndnQuaCBpbmRleCBlZjcxMGUyNTk3MjYuLmE0ZmQ5NzliM2RhZA0KPiA+
IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndnQuaA0KPiA+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndnQuaA0KPiA+IEBAIC05NCw3ICs5NCw2IEBA
IHN0cnVjdCBpbnRlbF92Z3B1X2ZlbmNlIHsNCj4gPg0KPiA+ICBzdHJ1Y3QgaW50ZWxfdmdwdV9t
bWlvIHsNCj4gPiAgCXZvaWQgKnZyZWc7DQo+ID4gLQl2b2lkICpzcmVnOw0KPiA+ICB9Ow0KPiA+
DQo+ID4gICNkZWZpbmUgSU5URUxfR1ZUX01BWF9CQVJfTlVNIDQNCj4gPiBAQCAtNDQ3LDEwICs0
NDYsNiBAQCB2b2lkIGludGVsX3ZncHVfd3JpdGVfZmVuY2Uoc3RydWN0IGludGVsX3ZncHUNCj4g
PiAqdmdwdSwNCj4gPiAgCSgqKHU2NCAqKSh2Z3B1LT5tbWlvLnZyZWcgKyBpOTE1X21taW9fcmVn
X29mZnNldChyZWcpKSkgICNkZWZpbmUNCj4gPiB2Z3B1X3ZyZWc2NCh2Z3B1LCBvZmZzZXQpIFwN
Cj4gPiAgCSgqKHU2NCAqKSh2Z3B1LT5tbWlvLnZyZWcgKyAob2Zmc2V0KSkpIC0jZGVmaW5lIHZn
cHVfc3JlZ190KHZncHUsDQo+ID4gcmVnKSBcDQo+ID4gLQkoKih1MzIgKikodmdwdS0+bW1pby5z
cmVnICsgaTkxNV9tbWlvX3JlZ19vZmZzZXQocmVnKSkpDQo+ID4gLSNkZWZpbmUgdmdwdV9zcmVn
KHZncHUsIG9mZnNldCkgXA0KPiA+IC0JKCoodTMyICopKHZncHUtPm1taW8uc3JlZyArIChvZmZz
ZXQpKSkNCj4gPg0KPiA+ICAjZGVmaW5lIGZvcl9lYWNoX2FjdGl2ZV92Z3B1KGd2dCwgdmdwdSwg
aWQpIFwNCj4gPiAgCWlkcl9mb3JfZWFjaF9lbnRyeSgoJihndnQpLT52Z3B1X2lkciksICh2Z3B1
KSwgKGlkKSkgXCBkaWZmIC0tZ2l0DQo+ID4gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFu
ZGxlcnMuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMNCj4gPiBp
bmRleCBiNWMwYWMwNDkyNWYuLjU0YmQwYjAzMzI5OCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2d2dC9oYW5kbGVycy5jDQo+ID4gQEAgLTM0ODksMTIgKzM0ODksMTEgQEAgaW50IGludGVs
X3ZncHVfbW1pb19yZWdfcncoc3RydWN0IGludGVsX3ZncHUNCj4gPiAqdmdwdSwgdW5zaWduZWQg
aW50IG9mZnNldCwNCj4gPiAgCQlyZXR1cm4gbW1pb19pbmZvLT5yZWFkKHZncHUsIG9mZnNldCwg
cGRhdGEsIGJ5dGVzKTsNCj4gPiAgCWVsc2Ugew0KPiA+ICAJCXU2NCByb19tYXNrID0gbW1pb19p
bmZvLT5yb19tYXNrOw0KPiA+IC0JCXUzMiBvbGRfdnJlZyA9IDAsIG9sZF9zcmVnID0gMDsNCj4g
PiArCQl1MzIgb2xkX3ZyZWcgPSAwOw0KPiA+ICAJCXU2NCBkYXRhID0gMDsNCj4gPg0KPiA+ICAJ
CWlmIChpbnRlbF9ndnRfbW1pb19oYXNfbW9kZV9tYXNrKGd2dCwgbW1pb19pbmZvLT5vZmZzZXQp
KSB7DQo+ID4gIAkJCW9sZF92cmVnID0gdmdwdV92cmVnKHZncHUsIG9mZnNldCk7DQo+ID4gLQkJ
CW9sZF9zcmVnID0gdmdwdV9zcmVnKHZncHUsIG9mZnNldCk7DQo+ID4gIAkJfQ0KPiA+DQo+ID4g
IAkJaWYgKGxpa2VseSghcm9fbWFzaykpDQo+ID4gQEAgLTM1MTYsOCArMzUxNSw2IEBAIGludCBp
bnRlbF92Z3B1X21taW9fcmVnX3J3KHN0cnVjdCBpbnRlbF92Z3B1DQo+ID4gKnZncHUsIHVuc2ln
bmVkIGludCBvZmZzZXQsDQo+ID4NCj4gPiAgCQkJdmdwdV92cmVnKHZncHUsIG9mZnNldCkgPSAo
b2xkX3ZyZWcgJiB+bWFzaykNCj4gPiAgCQkJCQl8ICh2Z3B1X3ZyZWcodmdwdSwgb2Zmc2V0KSAm
IG1hc2spOw0KPiA+IC0JCQl2Z3B1X3NyZWcodmdwdSwgb2Zmc2V0KSA9IChvbGRfc3JlZyAmIH5t
YXNrKQ0KPiA+IC0JCQkJCXwgKHZncHVfc3JlZyh2Z3B1LCBvZmZzZXQpICYgbWFzayk7DQo+ID4g
IAkJfQ0KPiA+ICAJfQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC9tbWlvLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9tbWlvLmMgaW5kZXgg
ZWQ0ZGYyZjZkNjBiLi4yNzFhY2NkNjg2NTENCj4gPiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndnQvbW1pby5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z3Z0L21taW8uYw0KPiA+IEBAIC0yMzksNyArMjM5LDYgQEAgdm9pZCBpbnRlbF92Z3B1X3Jlc2V0
X21taW8oc3RydWN0IGludGVsX3ZncHUNCj4gPiAqdmdwdSwgYm9vbCBkbWxyKQ0KPiA+DQo+ID4g
IAlpZiAoZG1scikgew0KPiA+ICAJCW1lbWNweSh2Z3B1LT5tbWlvLnZyZWcsIG1taW8sIGluZm8t
Pm1taW9fc2l6ZSk7DQo+ID4gLQkJbWVtY3B5KHZncHUtPm1taW8uc3JlZywgbW1pbywgaW5mby0+
bW1pb19zaXplKTsNCj4gPg0KPiA+ICAJCXZncHVfdnJlZ190KHZncHUsIEdFTjZfR1RfVEhSRUFE
X1NUQVRVU19SRUcpID0gMDsNCj4gPg0KPiA+IEBAIC0yODAsNyArMjc5LDYgQEAgdm9pZCBpbnRl
bF92Z3B1X3Jlc2V0X21taW8oc3RydWN0IGludGVsX3ZncHUNCj4gPiAqdmdwdSwgYm9vbCBkbWxy
KQ0KPiA+ICAJCSAqIHRvdWNoZWQNCj4gPiAgCQkgKi8NCj4gPiAgCQltZW1jcHkodmdwdS0+bW1p
by52cmVnLCBtbWlvLA0KPiA+IEdWVF9HRU44X01NSU9fUkVTRVRfT0ZGU0VUKTsNCj4gPiAtCQlt
ZW1jcHkodmdwdS0+bW1pby5zcmVnLCBtbWlvLA0KPiA+IEdWVF9HRU44X01NSU9fUkVTRVRfT0ZG
U0VUKTsNCj4gPiAgCX0NCj4gPg0KPiA+ICB9DQo+ID4gQEAgLTMwMCw4ICsyOTgsNiBAQCBpbnQg
aW50ZWxfdmdwdV9pbml0X21taW8oc3RydWN0IGludGVsX3ZncHUgKnZncHUpDQo+IHZncHUtPm1t
aW8udnJlZyA9IHZ6YWxsb2MoYXJyYXlfc2l6ZShpbmZvLT5tbWlvX3NpemUsIDIpKTsNCj4gWW91
IGNhbiByZWR1Y2UgdGhlIHNpemUgb2YgYWxsb2NhdGlvbiBoZXJlIGlmIHNyZWcgaXMgcmVtb3Zl
ZC4NCj4gDQo+ID4gIAlpZiAoIXZncHUtPm1taW8udnJlZykNCj4gPiAgCQlyZXR1cm4gLUVOT01F
TTsNCj4gPg0KPiA+IC0JdmdwdS0+bW1pby5zcmVnID0gdmdwdS0+bW1pby52cmVnICsgaW5mby0+
bW1pb19zaXplOw0KPiA+IC0NCj4gPiAgCWludGVsX3ZncHVfcmVzZXRfbW1pbyh2Z3B1LCB0cnVl
KTsNCj4gPg0KPiA+ICAJcmV0dXJuIDA7DQo+ID4gQEAgLTMxNSw1ICszMTEsNSBAQCBpbnQgaW50
ZWxfdmdwdV9pbml0X21taW8oc3RydWN0IGludGVsX3ZncHUgKnZncHUpDQo+ID4gIHZvaWQgaW50
ZWxfdmdwdV9jbGVhbl9tbWlvKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1KQ0KPiA+ICB7DQo+ID4g
IAl2ZnJlZSh2Z3B1LT5tbWlvLnZyZWcpOw0KPiA+IC0JdmdwdS0+bW1pby52cmVnID0gdmdwdS0+
bW1pby5zcmVnID0gTlVMTDsNCj4gPiArCXZncHUtPm1taW8udnJlZyA9IE5VTEw7DQo+ID4gIH0N
Cj4gPiAtLQ0KPiA+IDIuMTcuMQ0KPiA+DQo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18NCj4gPiBpbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdA0KPiA+
IGludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4gaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2DQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxp
bmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
