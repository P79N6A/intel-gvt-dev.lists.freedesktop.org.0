Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp7704836ywe;
        Thu, 7 Mar 2019 23:23:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqyjrDx2l+21vwqeX3LTmP/W3hFAVtDb5nOBPTPZX0rVjHDuWiSke7fLosUnjMTdkTy0sVKK
X-Received: by 2002:a63:f556:: with SMTP id e22mr15383969pgk.321.1552029806948;
        Thu, 07 Mar 2019 23:23:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552029806; cv=none;
        d=google.com; s=arc-20160816;
        b=NVFaRb5RyUxKhn9Ha5/aD70QEdTeQSHTwca3rOAOTN58RBtMavg3YdujAW8DBtAY4s
         Xa1z3gVO/aE3xFJ+z/NUt4VOS6JoW5NW/DiKk6dXL5/qSkvB43KitbYLeYVUCHFW4SJu
         4yBOh4FyUJWs0+Wfb34cS07OoBkMtqv/VQV4Y3tzTtyIEV5egsOb+fCJUbydtvBRsjPZ
         KDXBfseLXzZuabk8Rf2T8tpon1EHGSLSdVYQm48HcpIxGZK5q6EGPWsSDqoclusvz8Cq
         r1wvM/7f8hm7W9/uNrAHyjJWaGAuHE82QhRXzySdWMUmCmDpKlD7JMpNOjbBsP80wv23
         KZEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:dlp-reaction:dlp-version:dlp-product
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:to:from:delivered-to;
        bh=vALEn4wWgGx8G8GRorfLmdAjJc91nU3cMXMHY6/pVNY=;
        b=mQC/AgxGzVWPIMwyd+67cgDb2krgX/JpWLjXaEaAEU5x2cEiWSDebYmccYkSV/nfWV
         76sTsDKt9N6cO5v/HepqCt2MOO2lz1H9FgaliLTDcmvqnpo2TssFOUOOdBo67B9SE3T0
         O/3wqPG3Rbynsu2bRdWLsjlvtNjUxkUFLO/Bi4rBtVv8nYBhtrMxm1UBM9sQbA2GHZ6m
         UgBmHFJtQnhTk7LWzY5OLcGnw1oRRtF7rSZpnDusainZkczMqJ4Jki9QM4+TkeRTyAav
         spSJfc5LcaXYPjLBYHRuT7jUpLr6AAj1NVp4GdGS6FCtSKhY8lWTGKxBB8TuxkAa9U7A
         VtGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id h6si6364752pfd.115.2019.03.07.23.23.26
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Mar 2019 23:23:26 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 716296E287;
	Fri,  8 Mar 2019 07:23:26 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D796E287
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  8 Mar 2019 07:23:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Mar 2019 23:23:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,455,1544515200"; d="scan'208";a="122259427"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by orsmga006.jf.intel.com with ESMTP; 07 Mar 2019 23:23:24 -0800
Received: from fmsmsx102.amr.corp.intel.com (10.18.124.200) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 7 Mar 2019 23:23:24 -0800
Received: from shsmsx101.ccr.corp.intel.com (10.239.4.153) by
 FMSMSX102.amr.corp.intel.com (10.18.124.200) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 7 Mar 2019 23:23:23 -0800
Received: from shsmsx103.ccr.corp.intel.com ([169.254.4.134]) by
 SHSMSX101.ccr.corp.intel.com ([169.254.1.158]) with mapi id 14.03.0415.000;
 Fri, 8 Mar 2019 15:23:21 +0800
From: "He, Min" <min.he@intel.com>
To: "Zhao, Yan Y" <yan.y.zhao@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915/gvt: remove the unused sreg
Thread-Topic: [PATCH] drm/i915/gvt: remove the unused sreg
Thread-Index: AQHU1X8WmoCWfec2fkqg4Qhf0Ql8RaYBVFEg
Date: Fri, 8 Mar 2019 07:23:21 +0000
Message-ID: <B8F3B07A09E6B84F88EAD83F055E9945519CB29A@SHSMSX103.ccr.corp.intel.com>
References: <20190308071220.20202-1-yan.y.zhao@intel.com>
In-Reply-To: <20190308071220.20202-1-yan.y.zhao@intel.com>
Accept-Language: en-US
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
Cc: "Zhao, Yan Y" <yan.y.zhao@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaW50ZWwtZ3Z0LWRldiBb
bWFpbHRvOmludGVsLWd2dC1kZXYtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmddIE9uDQo+
IEJlaGFsZiBPZiBZYW4gWmhhbw0KPiBTZW50OiBGcmlkYXksIE1hcmNoIDgsIDIwMTkgMzoxMiBQ
TQ0KPiBUbzogaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IFpoYW8s
IFlhbiBZIDx5YW4ueS56aGFvQGludGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIXSBkcm0vaTkx
NS9ndnQ6IHJlbW92ZSB0aGUgdW51c2VkIHNyZWcNCj4gDQo+IGNvZGUgY2xlYW51cC4gc3JlZyBp
cyBub3QgdXNlZCBub3cuIHJlbW92ZSBpdCBmb3IgY29kZSBjbGVhbm5lc3MuDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBZYW4gWmhhbyA8eWFuLnkuemhhb0BpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d2dC5oICAgICAgfCA1IC0tLS0tDQo+ICBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYyB8IDUgKy0tLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2d2dC9tbWlvLmMgICAgIHwgNiArLS0tLS0NCj4gIDMgZmlsZXMgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndnQvZ3Z0LmggYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3Z0LmgNCj4g
aW5kZXggZWY3MTBlMjU5NzI2Li5hNGZkOTc5YjNkYWQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC9ndnQuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
Z3Z0LmgNCj4gQEAgLTk0LDcgKzk0LDYgQEAgc3RydWN0IGludGVsX3ZncHVfZmVuY2Ugew0KPiAN
Cj4gIHN0cnVjdCBpbnRlbF92Z3B1X21taW8gew0KPiAgCXZvaWQgKnZyZWc7DQo+IC0Jdm9pZCAq
c3JlZzsNCj4gIH07DQo+IA0KPiAgI2RlZmluZSBJTlRFTF9HVlRfTUFYX0JBUl9OVU0gNA0KPiBA
QCAtNDQ3LDEwICs0NDYsNiBAQCB2b2lkIGludGVsX3ZncHVfd3JpdGVfZmVuY2Uoc3RydWN0IGlu
dGVsX3ZncHUNCj4gKnZncHUsDQo+ICAJKCoodTY0ICopKHZncHUtPm1taW8udnJlZyArIGk5MTVf
bW1pb19yZWdfb2Zmc2V0KHJlZykpKQ0KPiAgI2RlZmluZSB2Z3B1X3ZyZWc2NCh2Z3B1LCBvZmZz
ZXQpIFwNCj4gIAkoKih1NjQgKikodmdwdS0+bW1pby52cmVnICsgKG9mZnNldCkpKQ0KPiAtI2Rl
ZmluZSB2Z3B1X3NyZWdfdCh2Z3B1LCByZWcpIFwNCj4gLQkoKih1MzIgKikodmdwdS0+bW1pby5z
cmVnICsgaTkxNV9tbWlvX3JlZ19vZmZzZXQocmVnKSkpDQo+IC0jZGVmaW5lIHZncHVfc3JlZyh2
Z3B1LCBvZmZzZXQpIFwNCj4gLQkoKih1MzIgKikodmdwdS0+bW1pby5zcmVnICsgKG9mZnNldCkp
KQ0KPiANCj4gICNkZWZpbmUgZm9yX2VhY2hfYWN0aXZlX3ZncHUoZ3Z0LCB2Z3B1LCBpZCkgXA0K
PiAgCWlkcl9mb3JfZWFjaF9lbnRyeSgoJihndnQpLT52Z3B1X2lkciksICh2Z3B1KSwgKGlkKSkg
XA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMNCj4g
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYw0KPiBpbmRleCBiNWMwYWMwNDky
NWYuLjU0YmQwYjAzMzI5OCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0
L2hhbmRsZXJzLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMN
Cj4gQEAgLTM0ODksMTIgKzM0ODksMTEgQEAgaW50IGludGVsX3ZncHVfbW1pb19yZWdfcncoc3Ry
dWN0IGludGVsX3ZncHUNCj4gKnZncHUsIHVuc2lnbmVkIGludCBvZmZzZXQsDQo+ICAJCXJldHVy
biBtbWlvX2luZm8tPnJlYWQodmdwdSwgb2Zmc2V0LCBwZGF0YSwgYnl0ZXMpOw0KPiAgCWVsc2Ug
ew0KPiAgCQl1NjQgcm9fbWFzayA9IG1taW9faW5mby0+cm9fbWFzazsNCj4gLQkJdTMyIG9sZF92
cmVnID0gMCwgb2xkX3NyZWcgPSAwOw0KPiArCQl1MzIgb2xkX3ZyZWcgPSAwOw0KPiAgCQl1NjQg
ZGF0YSA9IDA7DQo+IA0KPiAgCQlpZiAoaW50ZWxfZ3Z0X21taW9faGFzX21vZGVfbWFzayhndnQs
IG1taW9faW5mby0+b2Zmc2V0KSkNCj4gew0KPiAgCQkJb2xkX3ZyZWcgPSB2Z3B1X3ZyZWcodmdw
dSwgb2Zmc2V0KTsNCj4gLQkJCW9sZF9zcmVnID0gdmdwdV9zcmVnKHZncHUsIG9mZnNldCk7DQo+
ICAJCX0NCj4gDQo+ICAJCWlmIChsaWtlbHkoIXJvX21hc2spKQ0KPiBAQCAtMzUxNiw4ICszNTE1
LDYgQEAgaW50IGludGVsX3ZncHVfbW1pb19yZWdfcncoc3RydWN0IGludGVsX3ZncHUNCj4gKnZn
cHUsIHVuc2lnbmVkIGludCBvZmZzZXQsDQo+IA0KPiAgCQkJdmdwdV92cmVnKHZncHUsIG9mZnNl
dCkgPSAob2xkX3ZyZWcgJiB+bWFzaykNCj4gIAkJCQkJfCAodmdwdV92cmVnKHZncHUsIG9mZnNl
dCkgJiBtYXNrKTsNCj4gLQkJCXZncHVfc3JlZyh2Z3B1LCBvZmZzZXQpID0gKG9sZF9zcmVnICYg
fm1hc2spDQo+IC0JCQkJCXwgKHZncHVfc3JlZyh2Z3B1LCBvZmZzZXQpICYgbWFzayk7DQo+ICAJ
CX0NCj4gIAl9DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21t
aW8uYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9tbWlvLmMNCj4gaW5kZXggZWQ0ZGYy
ZjZkNjBiLi4yNzFhY2NkNjg2NTEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC9tbWlvLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21taW8uYw0KPiBA
QCAtMjM5LDcgKzIzOSw2IEBAIHZvaWQgaW50ZWxfdmdwdV9yZXNldF9tbWlvKHN0cnVjdCBpbnRl
bF92Z3B1ICp2Z3B1LA0KPiBib29sIGRtbHIpDQo+IA0KPiAgCWlmIChkbWxyKSB7DQo+ICAJCW1l
bWNweSh2Z3B1LT5tbWlvLnZyZWcsIG1taW8sIGluZm8tPm1taW9fc2l6ZSk7DQo+IC0JCW1lbWNw
eSh2Z3B1LT5tbWlvLnNyZWcsIG1taW8sIGluZm8tPm1taW9fc2l6ZSk7DQo+IA0KPiAgCQl2Z3B1
X3ZyZWdfdCh2Z3B1LCBHRU42X0dUX1RIUkVBRF9TVEFUVVNfUkVHKSA9IDA7DQo+IA0KPiBAQCAt
MjgwLDcgKzI3OSw2IEBAIHZvaWQgaW50ZWxfdmdwdV9yZXNldF9tbWlvKHN0cnVjdCBpbnRlbF92
Z3B1ICp2Z3B1LA0KPiBib29sIGRtbHIpDQo+ICAJCSAqIHRvdWNoZWQNCj4gIAkJICovDQo+ICAJ
CW1lbWNweSh2Z3B1LT5tbWlvLnZyZWcsIG1taW8sDQo+IEdWVF9HRU44X01NSU9fUkVTRVRfT0ZG
U0VUKTsNCj4gLQkJbWVtY3B5KHZncHUtPm1taW8uc3JlZywgbW1pbywNCj4gR1ZUX0dFTjhfTU1J
T19SRVNFVF9PRkZTRVQpOw0KPiAgCX0NCj4gDQo+ICB9DQo+IEBAIC0zMDAsOCArMjk4LDYgQEAg
aW50IGludGVsX3ZncHVfaW5pdF9tbWlvKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1KQ0KdmdwdS0+
bW1pby52cmVnID0gdnphbGxvYyhhcnJheV9zaXplKGluZm8tPm1taW9fc2l6ZSwgMikpOyANCllv
dSBjYW4gcmVkdWNlIHRoZSBzaXplIG9mIGFsbG9jYXRpb24gaGVyZSBpZiBzcmVnIGlzIHJlbW92
ZWQuDQoNCj4gIAlpZiAoIXZncHUtPm1taW8udnJlZykNCj4gIAkJcmV0dXJuIC1FTk9NRU07DQo+
IA0KPiAtCXZncHUtPm1taW8uc3JlZyA9IHZncHUtPm1taW8udnJlZyArIGluZm8tPm1taW9fc2l6
ZTsNCj4gLQ0KPiAgCWludGVsX3ZncHVfcmVzZXRfbW1pbyh2Z3B1LCB0cnVlKTsNCj4gDQo+ICAJ
cmV0dXJuIDA7DQo+IEBAIC0zMTUsNSArMzExLDUgQEAgaW50IGludGVsX3ZncHVfaW5pdF9tbWlv
KHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1KQ0KPiAgdm9pZCBpbnRlbF92Z3B1X2NsZWFuX21taW8o
c3RydWN0IGludGVsX3ZncHUgKnZncHUpDQo+ICB7DQo+ICAJdmZyZWUodmdwdS0+bW1pby52cmVn
KTsNCj4gLQl2Z3B1LT5tbWlvLnZyZWcgPSB2Z3B1LT5tbWlvLnNyZWcgPSBOVUxMOw0KPiArCXZn
cHUtPm1taW8udnJlZyA9IE5VTEw7DQo+ICB9DQo+IC0tDQo+IDIuMTcuMQ0KPiANCj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gaW50ZWwtZ3Z0LWRl
diBtYWlsaW5nIGxpc3QNCj4gaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4g
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQt
ZGV2DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRl
bC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2
dC1kZXY=
