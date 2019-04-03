Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp653ywo;
        Wed, 3 Apr 2019 02:19:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx+8KUALEvSI0uT6jlExZ9ZwPOxASMhjbgcD0LYS0wdzvUurwV70TyfP3/iEyWBF3WUQ4Mb
X-Received: by 2002:a63:9a4a:: with SMTP id e10mr69423463pgo.366.1554283140420;
        Wed, 03 Apr 2019 02:19:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554283140; cv=none;
        d=google.com; s=arc-20160816;
        b=ZjqpFfW52pok/SnAitV0ok1L2BOUD7VHyfpb6udM3kwfI4f5uCbHZeOdPTGxyilmya
         66n50pNT/avGO6Q220e05NgOS7XzdgTZ9c0R40lBntwMgNmex/Po11vmsi05rEJCVFBs
         dLnGrm2e4Z5BOH6daVvW3Vcql4o79lfRYIVNtS0LAFqPlWwkgGLGPfClZ7Y77Ns8GB4M
         s8MXgyUzV1i3x/NEWu3+r3wAlU37KTCNzISuggOHCCMCvtz5hLAAn1g1u+6S4qYsVFk2
         vEyG9yqFFgCft9fr/qGbz6xK874LHrmVj3hfJq10vQLw/HB/VJUWoDc9Yl+tcvNoSQhw
         Ibfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:dlp-reaction:dlp-version:dlp-product
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:to:from:delivered-to;
        bh=vyWojVms1uicQJOtMrVbTljvCXKP3inHzMnn4rM5Vu0=;
        b=kNjndckpmRjUWNh+F/h9IT7kcKYLrSiEJoUSWcSnFAJSKc3AJLNdWeVnU96FrDyvgv
         K2XPUBdrx6jX05+uIC5j5QvmUjIC3TS+VHrgp9yIVCawKfyn7uux0MDixOy6rvjG0w0s
         Q00x2/fajte5Sb+Ne3D4vjqy9XZ5VL2bdil/hTYUtIIcjjLE7LSUpypQfqGS9yjrcxpA
         c4J1EzixctJ5bSIQDjR3SfK+q5m8LMxyLNqyO3x1oyJ2CEevXTdfpd/66FsPDVoLyuVS
         BYYzUYhFW20cjyKISDw01a1czcG1Md9JWwN45hkwpGM1BwBnBlfQMLO9s2CegOTKysgG
         +c9g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id b2si13135421pgt.494.2019.04.03.02.18.59
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Apr 2019 02:19:00 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9EB66E880;
	Wed,  3 Apr 2019 09:18:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 893746E87D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  3 Apr 2019 09:18:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Apr 2019 02:18:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,304,1549958400"; d="scan'208";a="132570341"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by orsmga006.jf.intel.com with ESMTP; 03 Apr 2019 02:18:57 -0700
Received: from fmsmsx113.amr.corp.intel.com (10.18.116.7) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 3 Apr 2019 02:18:57 -0700
Received: from shsmsx153.ccr.corp.intel.com (10.239.6.53) by
 FMSMSX113.amr.corp.intel.com (10.18.116.7) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 3 Apr 2019 02:18:56 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.92]) by
 SHSMSX153.ccr.corp.intel.com ([169.254.12.139]) with mapi id 14.03.0415.000;
 Wed, 3 Apr 2019 17:18:17 +0800
From: "Yuan, Hang" <hang.yuan@intel.com>
To: "Zhang, Xiaolin" <xiaolin.zhang@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Subject: RE: [PATCH v5] drm/i915/gvt: addressed guest GPU hang with HWS
 index mode
Thread-Topic: [PATCH v5] drm/i915/gvt: addressed guest GPU hang with HWS
 index mode
Thread-Index: AQHU6fPdrqkcBsfqMU+ZNGc2E/eorKYqJ4xw
Date: Wed, 3 Apr 2019 09:18:17 +0000
Message-ID: <C294FBAE55175941838A8D362DCD8AA225ECCEEC@SHSMSX104.ccr.corp.intel.com>
References: <20190403080728.8140-1-xiaolin.zhang@intel.com>
In-Reply-To: <20190403080728.8140-1-xiaolin.zhang@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOTZhMzA5MzktYWEwNS00MTc0LWIyMGItNTM0OGJlNzcyM2M1IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiK0FtZllWRjhlM2pXcmxKTmNoZUNQMUhCMWJ0U2pzVVpXV2JqR3BvSXFtV2Q1M25YTEcrWEU4Sk5cL1FzRmw3YlAifQ==
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
Cc: "Zhang, Xiaolin" <xiaolin.zhang@intel.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBpbnRlbC1ndnQtZGV2IFttYWls
dG86aW50ZWwtZ3Z0LWRldi1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZ10gT24NCj4gQmVo
YWxmIE9mIFhpYW9saW4gWmhhbmcNCj4gU2VudDogV2VkbmVzZGF5LCBBcHJpbCAzLCAyMDE5IDQ6
MDcgUE0NCj4gVG86IGludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBa
aGFuZywgWGlhb2xpbiA8eGlhb2xpbi56aGFuZ0BpbnRlbC5jb20+OyB6aGVueXV3QGxpbnV4Lmlu
dGVsLmNvbQ0KPiBTdWJqZWN0OiBbUEFUQ0ggdjVdIGRybS9pOTE1L2d2dDogYWRkcmVzc2VkIGd1
ZXN0IEdQVSBoYW5nIHdpdGggSFdTDQo+IGluZGV4IG1vZGUNCj4gDQo+IHdpdGggdGhlIGludHJv
ZHVjZSBvZiAic3dpdGNoIHRvIHVzZSBIV1MgaW5kaWNlcyByYXRoZXIgdGhhbiBhZGRyZXNzIiwg
Z3Vlc3QNCj4gR1BVIGhhbmcgb2JzZXJ2ZWQgd2hlbiBydW5uaW5nIHdvcmtsb2FkcyB3aGljaCB3
aWxsIHVwZGF0ZSB0aGUgc2Vxbm8gdG8NCj4gdGhlIHJlYWwgSFcgSFdTUCwgbm90IHZpdHVyYWwg
R1BVIEhXU1AgYW5kIHRoZW4gY2F1c2UgR1BVIGhhbmcuDQo+IA0KPiB0aGlzIHBhdGNoIGlzIHRv
IHJldm9rZSBpbmRleCBtb2RlIGluIFBJUEVfQ1RSTCBhbmQgTUlfRkxVU0hfRFcgYW5kDQo+IHBh
dGNoIGd1ZXN0IEdQVSBIV1NQIGFkZHJlc3MgdmFsdWUgdG8gdGhlc2UgY29tbWFuZHMuDQo+IA0K
PiBGaXhlczogNTQ5MzllYTBiKCJkcm0vaTkxNTogU3dpdGNoIHRvIHVzZSBIV1MgaW5kaWNlcyBy
YXRoZXIgdGhhbg0KPiBhZGRyZXNzZXMiKQ0KPiANCj4gdjU6IHJlZmluZSBjb2RlIGxvZ2ljIHRv
IGhhbmRsZSBpbmRleF9tb2RlLg0KPiB2NDogY2FsbCBjbWRfYWRkcmVzc19hdWRpdCBmb3IgbmV3
IGFkZHJlc3MgY29udmVydGVkIGZyb20gaW5kZXguDQo+IHYzOiBoYW5kbGUgaW5kZXggbW9kZSB0
byBnbWEgY29udmVyc2lvbiB3aXRoaW4gY21kIGhhbmRsZXIgaXRzZWxmLg0KPiB2MjogUElQRV9D
VFJMIGFuZCBNSV9GTFVTSF9EVyBoYXMgZGlmZmVyZW50IGFkZHJlc3Mgb2Zmc2V0LCBvZmZzZXQg
aXMgYWxzbw0KPiBwYXNzZWQgZm9yIGdtYSBhZGRyZXNzIHVwZGF0ZS4gPHpoZW55dT4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IFhpYW9saW4gWmhhbmcgPHhpYW9saW4uemhhbmdAaW50ZWwuY29tPg0K
PiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9jbWRfcGFyc2VyLmMgfCAyMiArKysr
KysrKysrKysrKysrKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9jbWRfcGFyc2VyLmMN
Cj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvY21kX3BhcnNlci5jDQo+IGluZGV4IGI0MjA5
MTkyNzljNy4uMDgzYmE2NGM4ZjVkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndnQvY21kX3BhcnNlci5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9jbWRf
cGFyc2VyLmMNCj4gQEAgLTEwNzcsNiArMTA3Nyw4IEBAIHN0YXRpYyBpbnQgY21kX2hhbmRsZXJf
cGlwZV9jb250cm9sKHN0cnVjdA0KPiBwYXJzZXJfZXhlY19zdGF0ZSAqcykNCj4gIAlib29sIGlu
ZGV4X21vZGUgPSBmYWxzZTsNCj4gIAl1bnNpZ25lZCBpbnQgcG9zdF9zeW5jOw0KPiAgCWludCBy
ZXQgPSAwOw0KPiArCXUzMiBod3NfZ3BhOw0KPiArCXUzMiB2YWw7DQo+IA0KPiAgCXBvc3Rfc3lu
YyA9IChjbWRfdmFsKHMsIDEpICYNCj4gUElQRV9DT05UUk9MX1BPU1RfU1lOQ19PUF9NQVNLKSA+
PiAxNDsNCj4gDQo+IEBAIC0xMTAwLDYgKzExMDIsMTUgQEAgc3RhdGljIGludCBjbWRfaGFuZGxl
cl9waXBlX2NvbnRyb2woc3RydWN0DQo+IHBhcnNlcl9leGVjX3N0YXRlICpzKQ0KPiAgCQkJCQlp
bmRleF9tb2RlID0gdHJ1ZTsNCj4gIAkJCQlyZXQgfD0gY21kX2FkZHJlc3NfYXVkaXQocywgZ21h
LCBzaXplb2YodTY0KSwNCj4gIAkJCQkJCWluZGV4X21vZGUpOw0KPiArCQkJCWlmIChyZXQpDQo+
ICsJCQkJCXJldHVybiByZXQ7DQo+ICsJCQkJaWYgKGluZGV4X21vZGUpIHsNCj4gKwkJCQkJaHdz
X2dwYSA9IHMtPnZncHUtPmh3c19wZ2Fbcy0NCj4gPnJpbmdfaWRdOw0KW1l1YW4sIEhhbmddIEZy
b20gc3BlYywgaW5kZXggbWF5IGJlIGluIGdsb2JhbCBIVyBzdGF0dXMgcGFnZSBvciAgcGVyLXBy
b2Nlc3MgSFcgc3RhdHVzIHBhZ2UgZGVwZW5kaW5nIG9uIGRlc3RpbmF0aW9uIGFkZHJlc3MgdHlw
ZS4gU3RpbGwgbm90IGNsZWFyIGlmIHdlIGNhbiBhc3N1bWUgdGhlIGluZGV4IGlzIGFsd2FyeSBp
biBnbG9iYWwgSFcgc3RhdHVzIHBhZ2Ugb3IgYXQgbGVhc3QgcHJpbnQgYW55IHdhcm5pbmcgb24g
ZGV0ZWN0aW5nIHBlci1wcm9jZXNzIEhXIHN0YXR1cyBwYWdlIGNhc2U/DQo+ICsJCQkJCWdtYSA9
IGh3c19ncGEgKyBnbWE7DQo+ICsJCQkJCXBhdGNoX3ZhbHVlKHMsIGNtZF9wdHIocywgMiksIGdt
YSk7DQo+ICsJCQkJCXZhbCA9IGNtZF92YWwocywgMSkgJiAofigxIDw8IDIxKSk7DQo+ICsJCQkJ
CXBhdGNoX3ZhbHVlKHMsIGNtZF9wdHIocywgMSksIHZhbCk7DQo+ICsJCQkJfQ0KPiAgCQkJfQ0K
PiAgCQl9DQo+ICAJfQ0KPiBAQCAtMTU5OCw2ICsxNjA5LDggQEAgc3RhdGljIGludCBjbWRfaGFu
ZGxlcl9taV9mbHVzaF9kdyhzdHJ1Y3QNCj4gcGFyc2VyX2V4ZWNfc3RhdGUgKnMpDQo+ICAJdW5z
aWduZWQgbG9uZyBnbWE7DQo+ICAJYm9vbCBpbmRleF9tb2RlID0gZmFsc2U7DQo+ICAJaW50IHJl
dCA9IDA7DQo+ICsJdTMyIGh3c19ncGE7DQo+ICsJdTMyIHZhbDsNCj4gDQo+ICAJLyogQ2hlY2sg
cG9zdC1zeW5jIGFuZCBwcGd0dCBiaXQgKi8NCj4gIAlpZiAoKChjbWRfdmFsKHMsIDApID4+IDE0
KSAmIDB4MykgJiYgKGNtZF92YWwocywgMSkgJiAoMSA8PCAyKSkpIHsgQEAgLQ0KPiAxNjA4LDYg
KzE2MjEsMTUgQEAgc3RhdGljIGludCBjbWRfaGFuZGxlcl9taV9mbHVzaF9kdyhzdHJ1Y3QNCj4g
cGFyc2VyX2V4ZWNfc3RhdGUgKnMpDQo+ICAJCWlmIChjbWRfdmFsKHMsIDApICYgKDEgPDwgMjEp
KQ0KPiAgCQkJaW5kZXhfbW9kZSA9IHRydWU7DQo+ICAJCXJldCA9IGNtZF9hZGRyZXNzX2F1ZGl0
KHMsIGdtYSwgc2l6ZW9mKHU2NCksIGluZGV4X21vZGUpOw0KPiArCQlpZiAocmV0KQ0KPiArCQkJ
cmV0dXJuIHJldDsNCj4gKwkJaWYgKGluZGV4X21vZGUpIHsNCj4gKwkJCWh3c19ncGEgPSBzLT52
Z3B1LT5od3NfcGdhW3MtPnJpbmdfaWRdOw0KPiArCQkJZ21hID0gaHdzX2dwYSArIGdtYTsNCj4g
KwkJCXBhdGNoX3ZhbHVlKHMsIGNtZF9wdHIocywgMSksIGdtYSk7DQo+ICsJCQl2YWwgPSBjbWRf
dmFsKHMsIDApICYgKH4oMSA8PCAyMSkpOw0KPiArCQkJcGF0Y2hfdmFsdWUocywgY21kX3B0cihz
LCAwKSwgdmFsKTsNCj4gKwkJfQ0KPiAgCX0NCj4gIAkvKiBDaGVjayBub3RpZnkgYml0ICovDQo+
ICAJaWYgKChjbWRfdmFsKHMsIDApICYgKDEgPDwgOCkpKQ0KPiAtLQ0KPiAyLjE1LjENCj4gDQo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IGludGVs
LWd2dC1kZXYgbWFpbGluZyBsaXN0DQo+IGludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnDQo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50
ZWwtZ3Z0LWRldg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
bnRlbC1ndnQtZGV2
