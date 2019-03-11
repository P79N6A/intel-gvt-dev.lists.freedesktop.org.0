Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5a0b:0:0:0:0:0 with SMTP id o11csp931492ywb;
        Sun, 10 Mar 2019 18:49:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyYZSDK2wcpA0O07fw4E1BvK01M2SH67wgtC/emsoi1iCVajpz68tIDqqFci+rxQk8Yo90Y
X-Received: by 2002:a63:4962:: with SMTP id y34mr28572758pgk.425.1552268995694;
        Sun, 10 Mar 2019 18:49:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552268995; cv=none;
        d=google.com; s=arc-20160816;
        b=z8hfNOyP/QZUkczxel3ie71k6kAWtpUN/E/RPgwyJ7KdqMOVL8NeAyZknz4Rqy1+fw
         EfE/q2z9wpU4iNpAnLVp7JaXBkyyhSZzBYz/u3SlhPsRZgOuKQzbYv46BpU9OREEZti0
         AYcgPisiqZDIcoiRftrBarhcSwgnIQ3w98yIIGujc1MBN8hrh+LKODBSlBKAZzoPjBYx
         wxATzOYY5doB9Fwp0Ok1ohX0YATy3+NnqcUMPtYmr0Wj0uGLrqRDOuUF6GewTQ46Hz91
         yFfpuG2uNHdFqeAd9xRuLxsqfzeSHYpd74GnJIfc0x/WSTvpLWcJkzhxueYvkMlfILqv
         iU/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:dlp-reaction:dlp-version:dlp-product
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:to:from:delivered-to;
        bh=EqpD9rIi1hxN+WKxAUadEaNyI1afJpcihRKEVCqAbpY=;
        b=i65dwObeD+6385QcXAsMtPUpMqvaJm/1MGwWLFkLp80vGtI8jP2E8NOf24N3SXM/EZ
         gaUN0MnbDsVfe9hww4Z2nEsHgsx39WWvvO8c+mD+uYwgTRTqDToeaKKywhvt773DRU1Y
         TrGiu9xTzH62hDmnyl5ekIHmHs92J9oyQyq4y4jOdLa1PxBcqn2xJuyVBJhJvo/klOYa
         Pi8WvJYMcFGeXBUPr+9pruLdmBBBMxhitG2b3d522/HBHsKGW1RzSiy6TZ2WgApe3xZp
         gmnUGuEYiiaqgd7m558Fk0RrVTczYj0sCbU+LwH7mxJLT4w/W1NveMvzIKUfVpgqrWLE
         9MKA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id j19si4007678pgk.546.2019.03.10.18.49.55
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 10 Mar 2019 18:49:55 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31CE7899B0;
	Mon, 11 Mar 2019 01:49:55 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3227899B0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 11 Mar 2019 01:49:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Mar 2019 18:49:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,466,1544515200"; d="scan'208";a="139649088"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by FMSMGA003.fm.intel.com with ESMTP; 10 Mar 2019 18:49:53 -0700
Received: from fmsmsx155.amr.corp.intel.com (10.18.116.71) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Sun, 10 Mar 2019 18:49:53 -0700
Received: from shsmsx152.ccr.corp.intel.com (10.239.6.52) by
 FMSMSX155.amr.corp.intel.com (10.18.116.71) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Sun, 10 Mar 2019 18:49:52 -0700
Received: from shsmsx103.ccr.corp.intel.com ([169.254.4.134]) by
 SHSMSX152.ccr.corp.intel.com ([169.254.6.80]) with mapi id 14.03.0415.000;
 Mon, 11 Mar 2019 09:49:50 +0800
From: "He, Min" <min.he@intel.com>
To: "Zhao, Yan Y" <yan.y.zhao@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Subject: RE: [PATCH v5 1/2] drm/i915/gvt: remove the unused sreg
Thread-Topic: [PATCH v5 1/2] drm/i915/gvt: remove the unused sreg
Thread-Index: AQHU16xR3gaXKoHWAk2tsZs6cElq86YFqfag
Date: Mon, 11 Mar 2019 01:49:50 +0000
Message-ID: <B8F3B07A09E6B84F88EAD83F055E9945519CC56B@SHSMSX103.ccr.corp.intel.com>
References: <20190311014045.13977-1-yan.y.zhao@intel.com>
In-Reply-To: <20190311014045.13977-1-yan.y.zhao@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNDFkODAyYWUtYzg4NS00YTYxLTliYzktMmJhMThlYmYzZjcwIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiQ3JXa0V2Z0htVGtCZ28wVnRaakh3OVg5bEZUZW4zSzdaOWVyTFdCbHM1dWxobXVVM0ZjbzJoMVl6WG1UclpMTCJ9
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
Cc: "Zhao, Yan Y" <yan.y.zhao@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

TG9va3MgZ29vZCB0byBtZS4gVGhhbmtzLg0KUmV2aWV3ZWQtYnk6IEhlLCBNaW4gPG1pbi5oZUBp
bnRlbC5jb20+DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaW50ZWwt
Z3Z0LWRldiBbbWFpbHRvOmludGVsLWd2dC1kZXYtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5v
cmddIE9uDQo+IEJlaGFsZiBPZiBZYW4gWmhhbw0KPiBTZW50OiBNb25kYXksIE1hcmNoIDExLCAy
MDE5IDk6NDEgQU0NCj4gVG86IGludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+
IENjOiBaaGFvLCBZYW4gWSA8eWFuLnkuemhhb0BpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRD
SCB2NSAxLzJdIGRybS9pOTE1L2d2dDogcmVtb3ZlIHRoZSB1bnVzZWQgc3JlZw0KPiANCj4gY29k
ZSBjbGVhbnVwLiBzcmVnIGlzIG5vdCB1c2VkIG5vdy4gcmVtb3ZlIGl0IGZvciBjb2RlIGNsZWFu
bmVzcy4NCj4gDQo+IHYzOiByZW1vdmUgdW5uZWNlc3NhcnkgYXJyYXlfc2l6ZSBpbiB2cmVnJ3Mg
bWVtb3J5IGFsbG9jYXRpb24gKG1pbiBoZSkNCj4gdjI6IGRvIG5vdCBhbGxvY2F0ZSBtZW1vcnkg
Zm9yIHNyZWcuIChtaW4gaGUpDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBZYW4gWmhhbyA8eWFuLnku
emhhb0BpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d2dC5o
ICAgICAgfCA1IC0tLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYyB8
IDUgKy0tLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9tbWlvLmMgICAgIHwgOCArKy0t
LS0tLQ0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndnQuaCBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndnQuaA0KPiBpbmRleCBlZjcxMGUyNTk3MjYuLmE0ZmQ5
NzliM2RhZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d2dC5oDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndnQuaA0KPiBAQCAtOTQsNyArOTQsNiBA
QCBzdHJ1Y3QgaW50ZWxfdmdwdV9mZW5jZSB7DQo+IA0KPiAgc3RydWN0IGludGVsX3ZncHVfbW1p
byB7DQo+ICAJdm9pZCAqdnJlZzsNCj4gLQl2b2lkICpzcmVnOw0KPiAgfTsNCj4gDQo+ICAjZGVm
aW5lIElOVEVMX0dWVF9NQVhfQkFSX05VTSA0DQo+IEBAIC00NDcsMTAgKzQ0Niw2IEBAIHZvaWQg
aW50ZWxfdmdwdV93cml0ZV9mZW5jZShzdHJ1Y3QgaW50ZWxfdmdwdQ0KPiAqdmdwdSwNCj4gIAko
Kih1NjQgKikodmdwdS0+bW1pby52cmVnICsgaTkxNV9tbWlvX3JlZ19vZmZzZXQocmVnKSkpDQo+
ICAjZGVmaW5lIHZncHVfdnJlZzY0KHZncHUsIG9mZnNldCkgXA0KPiAgCSgqKHU2NCAqKSh2Z3B1
LT5tbWlvLnZyZWcgKyAob2Zmc2V0KSkpDQo+IC0jZGVmaW5lIHZncHVfc3JlZ190KHZncHUsIHJl
ZykgXA0KPiAtCSgqKHUzMiAqKSh2Z3B1LT5tbWlvLnNyZWcgKyBpOTE1X21taW9fcmVnX29mZnNl
dChyZWcpKSkNCj4gLSNkZWZpbmUgdmdwdV9zcmVnKHZncHUsIG9mZnNldCkgXA0KPiAtCSgqKHUz
MiAqKSh2Z3B1LT5tbWlvLnNyZWcgKyAob2Zmc2V0KSkpDQo+IA0KPiAgI2RlZmluZSBmb3JfZWFj
aF9hY3RpdmVfdmdwdShndnQsIHZncHUsIGlkKSBcDQo+ICAJaWRyX2Zvcl9lYWNoX2VudHJ5KCgm
KGd2dCktPnZncHVfaWRyKSwgKHZncHUpLCAoaWQpKSBcDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2
dC9oYW5kbGVycy5jDQo+IGluZGV4IGI1YzBhYzA0OTI1Zi4uNTRiZDBiMDMzMjk4IDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYw0KPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYw0KPiBAQCAtMzQ4OSwxMiArMzQ4OSwxMSBA
QCBpbnQgaW50ZWxfdmdwdV9tbWlvX3JlZ19ydyhzdHJ1Y3QgaW50ZWxfdmdwdQ0KPiAqdmdwdSwg
dW5zaWduZWQgaW50IG9mZnNldCwNCj4gIAkJcmV0dXJuIG1taW9faW5mby0+cmVhZCh2Z3B1LCBv
ZmZzZXQsIHBkYXRhLCBieXRlcyk7DQo+ICAJZWxzZSB7DQo+ICAJCXU2NCByb19tYXNrID0gbW1p
b19pbmZvLT5yb19tYXNrOw0KPiAtCQl1MzIgb2xkX3ZyZWcgPSAwLCBvbGRfc3JlZyA9IDA7DQo+
ICsJCXUzMiBvbGRfdnJlZyA9IDA7DQo+ICAJCXU2NCBkYXRhID0gMDsNCj4gDQo+ICAJCWlmIChp
bnRlbF9ndnRfbW1pb19oYXNfbW9kZV9tYXNrKGd2dCwgbW1pb19pbmZvLT5vZmZzZXQpKQ0KPiB7
DQo+ICAJCQlvbGRfdnJlZyA9IHZncHVfdnJlZyh2Z3B1LCBvZmZzZXQpOw0KPiAtCQkJb2xkX3Ny
ZWcgPSB2Z3B1X3NyZWcodmdwdSwgb2Zmc2V0KTsNCj4gIAkJfQ0KPiANCj4gIAkJaWYgKGxpa2Vs
eSghcm9fbWFzaykpDQo+IEBAIC0zNTE2LDggKzM1MTUsNiBAQCBpbnQgaW50ZWxfdmdwdV9tbWlv
X3JlZ19ydyhzdHJ1Y3QgaW50ZWxfdmdwdQ0KPiAqdmdwdSwgdW5zaWduZWQgaW50IG9mZnNldCwN
Cj4gDQo+ICAJCQl2Z3B1X3ZyZWcodmdwdSwgb2Zmc2V0KSA9IChvbGRfdnJlZyAmIH5tYXNrKQ0K
PiAgCQkJCQl8ICh2Z3B1X3ZyZWcodmdwdSwgb2Zmc2V0KSAmIG1hc2spOw0KPiAtCQkJdmdwdV9z
cmVnKHZncHUsIG9mZnNldCkgPSAob2xkX3NyZWcgJiB+bWFzaykNCj4gLQkJCQkJfCAodmdwdV9z
cmVnKHZncHUsIG9mZnNldCkgJiBtYXNrKTsNCj4gIAkJfQ0KPiAgCX0NCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvbW1pby5jDQo+IGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Z0L21taW8uYw0KPiBpbmRleCBlZDRkZjJmNmQ2MGIuLmE1NTE3ODg4NGQ2NyAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21taW8uYw0KPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvbW1pby5jDQo+IEBAIC0yMzksNyArMjM5LDYgQEAgdm9pZCBp
bnRlbF92Z3B1X3Jlc2V0X21taW8oc3RydWN0IGludGVsX3ZncHUgKnZncHUsDQo+IGJvb2wgZG1s
cikNCj4gDQo+ICAJaWYgKGRtbHIpIHsNCj4gIAkJbWVtY3B5KHZncHUtPm1taW8udnJlZywgbW1p
bywgaW5mby0+bW1pb19zaXplKTsNCj4gLQkJbWVtY3B5KHZncHUtPm1taW8uc3JlZywgbW1pbywg
aW5mby0+bW1pb19zaXplKTsNCj4gDQo+ICAJCXZncHVfdnJlZ190KHZncHUsIEdFTjZfR1RfVEhS
RUFEX1NUQVRVU19SRUcpID0gMDsNCj4gDQo+IEBAIC0yODAsNyArMjc5LDYgQEAgdm9pZCBpbnRl
bF92Z3B1X3Jlc2V0X21taW8oc3RydWN0IGludGVsX3ZncHUgKnZncHUsDQo+IGJvb2wgZG1scikN
Cj4gIAkJICogdG91Y2hlZA0KPiAgCQkgKi8NCj4gIAkJbWVtY3B5KHZncHUtPm1taW8udnJlZywg
bW1pbywNCj4gR1ZUX0dFTjhfTU1JT19SRVNFVF9PRkZTRVQpOw0KPiAtCQltZW1jcHkodmdwdS0+
bW1pby5zcmVnLCBtbWlvLA0KPiBHVlRfR0VOOF9NTUlPX1JFU0VUX09GRlNFVCk7DQo+ICAJfQ0K
PiANCj4gIH0NCj4gQEAgLTI5NiwxMiArMjk0LDEwIEBAIGludCBpbnRlbF92Z3B1X2luaXRfbW1p
byhzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSkNCj4gIHsNCj4gIAljb25zdCBzdHJ1Y3QgaW50ZWxf
Z3Z0X2RldmljZV9pbmZvICppbmZvID0gJnZncHUtPmd2dC0+ZGV2aWNlX2luZm87DQo+IA0KPiAt
CXZncHUtPm1taW8udnJlZyA9IHZ6YWxsb2MoYXJyYXlfc2l6ZShpbmZvLT5tbWlvX3NpemUsIDIp
KTsNCj4gKwl2Z3B1LT5tbWlvLnZyZWcgPSB2emFsbG9jKGluZm8tPm1taW9fc2l6ZSk7DQo+ICAJ
aWYgKCF2Z3B1LT5tbWlvLnZyZWcpDQo+ICAJCXJldHVybiAtRU5PTUVNOw0KPiANCj4gLQl2Z3B1
LT5tbWlvLnNyZWcgPSB2Z3B1LT5tbWlvLnZyZWcgKyBpbmZvLT5tbWlvX3NpemU7DQo+IC0NCj4g
IAlpbnRlbF92Z3B1X3Jlc2V0X21taW8odmdwdSwgdHJ1ZSk7DQo+IA0KPiAgCXJldHVybiAwOw0K
PiBAQCAtMzE1LDUgKzMxMSw1IEBAIGludCBpbnRlbF92Z3B1X2luaXRfbW1pbyhzdHJ1Y3QgaW50
ZWxfdmdwdSAqdmdwdSkNCj4gIHZvaWQgaW50ZWxfdmdwdV9jbGVhbl9tbWlvKHN0cnVjdCBpbnRl
bF92Z3B1ICp2Z3B1KQ0KPiAgew0KPiAgCXZmcmVlKHZncHUtPm1taW8udnJlZyk7DQo+IC0Jdmdw
dS0+bW1pby52cmVnID0gdmdwdS0+bW1pby5zcmVnID0gTlVMTDsNCj4gKwl2Z3B1LT5tbWlvLnZy
ZWcgPSBOVUxMOw0KPiAgfQ0KPiAtLQ0KPiAyLjE3LjENCj4gDQo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IGludGVsLWd2dC1kZXYgbWFpbGluZyBs
aXN0DQo+IGludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IGh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBt
YWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
