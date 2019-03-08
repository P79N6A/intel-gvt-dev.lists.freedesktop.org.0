Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp7726219ywe;
        Thu, 7 Mar 2019 23:52:55 -0800 (PST)
X-Google-Smtp-Source: APXvYqz5o+aZIULT/Sj1UXwgqFIYcAD2HJHaa8ht3UkWKoSqEdruNcGnoRsaG6z/rJbDda7VSSXC
X-Received: by 2002:a62:e0ca:: with SMTP id d71mr16922927pfm.62.1552031575508;
        Thu, 07 Mar 2019 23:52:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552031575; cv=none;
        d=google.com; s=arc-20160816;
        b=pctn8RNDM0mehH66NQrugu8FigqOCBNmvaWCe6wFzqiL/AlAVHTHMcJ1X9WZmQWvcf
         p4YnDFjegzj5deaz/+1Cw3tDiydhFb6bYiAENWms4/ClgrpXw+9L7Xn4BDW7hFErCXM5
         ube79z/GMRBU9iAfseIorJfElnIFAjzWNtYFfEpLq9pHAEhkjDru9dnbgnv/0xSdmuAE
         BjEL20aF+D/4ybbx99U9ErxZCK189N9nXrS/w2W4CEqghkaNICY4szKfFFy4X0MsR18a
         IspuNG84n5MP+x1/m5t2WLEa9l0+ZD0bMQEqymyaMsofxhxDf7Iz/EOe9m0tkGi8iUbd
         mOJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence
         :mime-version:dlp-reaction:dlp-version:dlp-product:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:delivered-to;
        bh=Ejtlf0ooUapA+iZLGubrYv1vWwhscQsSP1Ip6AT5PXs=;
        b=Xhry3jHDIoTo+jMK+tJ9YfivbqwzshI1ZS8QejyEgW71Nx9+38WwZHnM6FwxRpwc+6
         HuMweOfF4XxXsM/q7OpoNEsGbuMgWN82FrSzF3KEYluQI4fUsOC7EWrKNpt1GyRPSYRQ
         a5dFp5Idxw18mHqMzlTAmHn3m4Fay8eKFGFHlgBrBlhXGgYwSammmiF1aI5j+S0Smi+o
         GQMe/4N1ubopgQqUIf6I/0mj3Ix+DkMeyxLN85pclGzXAt4sBPdoCG9xgmu1ZF6ZZlGr
         g8Du443OEozxWDusOAHybnD3cS6XJ/A0ELnqCGj/o2WaUZsQXQVx4F8mX0J9l5M501i4
         WNzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id p12si6300036plo.206.2019.03.07.23.52.55
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Mar 2019 23:52:55 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F6B96E29A;
	Fri,  8 Mar 2019 07:52:55 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B10C96E29A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  8 Mar 2019 07:52:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Mar 2019 23:52:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,455,1544515200"; d="scan'208";a="153157125"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by fmsmga001.fm.intel.com with ESMTP; 07 Mar 2019 23:52:53 -0800
Received: from fmsmsx161.amr.corp.intel.com (10.18.125.9) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 7 Mar 2019 23:52:53 -0800
Received: from shsmsx101.ccr.corp.intel.com (10.239.4.153) by
 FMSMSX161.amr.corp.intel.com (10.18.125.9) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 7 Mar 2019 23:52:52 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.74]) by
 SHSMSX101.ccr.corp.intel.com ([169.254.1.158]) with mapi id 14.03.0415.000;
 Fri, 8 Mar 2019 15:51:01 +0800
From: "Zhao, Yan Y" <yan.y.zhao@intel.com>
To: "He, Min" <min.he@intel.com>, "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>
Subject: RE: [PATCH v2] drm/i915/gvt: remove the unused sreg
Thread-Topic: [PATCH v2] drm/i915/gvt: remove the unused sreg
Thread-Index: AQHU1YEPSv7DMJRuuE60yL9Pdh3KlqYA1KyAgACHZHA=
Date: Fri, 8 Mar 2019 07:51:00 +0000
Message-ID: <F22B14EC3CFBB843AD3E03B6B78F2C6A4ADE7F4C@SHSMSX104.ccr.corp.intel.com>
References: <20190308072651.27063-1-yan.y.zhao@intel.com>
 <B8F3B07A09E6B84F88EAD83F055E9945519CB311@SHSMSX103.ccr.corp.intel.com>
In-Reply-To: <B8F3B07A09E6B84F88EAD83F055E9945519CB311@SHSMSX103.ccr.corp.intel.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNTIyMmRjMGQtN2FkNi00YTFhLTg3ZTEtYzNiOWIzNTUxODU3IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiUVlMVnNXd2FIb0RXNDVKT0VtYUpRalhSVHg1cTFVRnc1TEZPT0pCVExuXC9ONlJibHFIY29kWllaTTBnNU05cUwifQ==
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSGUsIE1pbg0KPiBTZW50
OiBGcmlkYXksIE1hcmNoIDgsIDIwMTkgMzo0NSBQTQ0KPiBUbzogWmhhbywgWWFuIFkgPHlhbi55
LnpoYW9AaW50ZWwuY29tPjsgaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4g
Q2M6IFpoYW8sIFlhbiBZIDx5YW4ueS56aGFvQGludGVsLmNvbT4NCj4gU3ViamVjdDogUkU6IFtQ
QVRDSCB2Ml0gZHJtL2k5MTUvZ3Z0OiByZW1vdmUgdGhlIHVudXNlZCBzcmVnDQo+IA0KPiANCj4g
DQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBpbnRlbC1ndnQtZGV2
DQo+ID4gW21haWx0bzppbnRlbC1ndnQtZGV2LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
XSBPbiBCZWhhbGYgT2YgWWFuDQo+ID4gWmhhbw0KPiA+IFNlbnQ6IEZyaWRheSwgTWFyY2ggOCwg
MjAxOSAzOjI3IFBNDQo+ID4gVG86IGludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
DQo+ID4gQ2M6IFpoYW8sIFlhbiBZIDx5YW4ueS56aGFvQGludGVsLmNvbT4NCj4gPiBTdWJqZWN0
OiBbUEFUQ0ggdjJdIGRybS9pOTE1L2d2dDogcmVtb3ZlIHRoZSB1bnVzZWQgc3JlZw0KPiA+DQo+
ID4gY29kZSBjbGVhbnVwLiBzcmVnIGlzIG5vdCB1c2VkIG5vdy4gcmVtb3ZlIGl0IGZvciBjb2Rl
IGNsZWFubmVzcy4NCj4gPg0KPiA+IHYyOiBkbyBub3QgYWxsb2NhdGUgbWVtb3J5IGZvciBzcmVn
LiAobWluIGhlKQ0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogWWFuIFpoYW8gPHlhbi55LnpoYW9A
aW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3Z0Lmgg
ICAgICB8IDUgLS0tLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMg
fCA1ICstLS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9tbWlvLmMgICAgIHwgOCAr
Ky0tLS0tLQ0KPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRp
b25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d2
dC5oDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3Z0LmggaW5kZXggZWY3MTBlMjU5
NzI2Li5hNGZkOTc5YjNkYWQNCj4gPiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndnQvZ3Z0LmgNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3Z0LmgN
Cj4gPiBAQCAtOTQsNyArOTQsNiBAQCBzdHJ1Y3QgaW50ZWxfdmdwdV9mZW5jZSB7DQo+ID4NCj4g
PiAgc3RydWN0IGludGVsX3ZncHVfbW1pbyB7DQo+ID4gIAl2b2lkICp2cmVnOw0KPiA+IC0Jdm9p
ZCAqc3JlZzsNCj4gPiAgfTsNCj4gPg0KPiA+ICAjZGVmaW5lIElOVEVMX0dWVF9NQVhfQkFSX05V
TSA0DQo+ID4gQEAgLTQ0NywxMCArNDQ2LDYgQEAgdm9pZCBpbnRlbF92Z3B1X3dyaXRlX2ZlbmNl
KHN0cnVjdCBpbnRlbF92Z3B1DQo+ID4gKnZncHUsDQo+ID4gIAkoKih1NjQgKikodmdwdS0+bW1p
by52cmVnICsgaTkxNV9tbWlvX3JlZ19vZmZzZXQocmVnKSkpICAjZGVmaW5lDQo+ID4gdmdwdV92
cmVnNjQodmdwdSwgb2Zmc2V0KSBcDQo+ID4gIAkoKih1NjQgKikodmdwdS0+bW1pby52cmVnICsg
KG9mZnNldCkpKSAtI2RlZmluZSB2Z3B1X3NyZWdfdCh2Z3B1LA0KPiA+IHJlZykgXA0KPiA+IC0J
KCoodTMyICopKHZncHUtPm1taW8uc3JlZyArIGk5MTVfbW1pb19yZWdfb2Zmc2V0KHJlZykpKQ0K
PiA+IC0jZGVmaW5lIHZncHVfc3JlZyh2Z3B1LCBvZmZzZXQpIFwNCj4gPiAtCSgqKHUzMiAqKSh2
Z3B1LT5tbWlvLnNyZWcgKyAob2Zmc2V0KSkpDQo+ID4NCj4gPiAgI2RlZmluZSBmb3JfZWFjaF9h
Y3RpdmVfdmdwdShndnQsIHZncHUsIGlkKSBcDQo+ID4gIAlpZHJfZm9yX2VhY2hfZW50cnkoKCYo
Z3Z0KS0+dmdwdV9pZHIpLCAodmdwdSksIChpZCkpIFwgZGlmZiAtLWdpdA0KPiA+IGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC9oYW5kbGVycy5jDQo+ID4gaW5kZXggYjVjMGFjMDQ5MjVmLi41NGJkMGIwMzMyOTggMTAw
NjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMNCj4gPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYw0KPiA+IEBAIC0zNDg5LDEy
ICszNDg5LDExIEBAIGludCBpbnRlbF92Z3B1X21taW9fcmVnX3J3KHN0cnVjdCBpbnRlbF92Z3B1
DQo+ID4gKnZncHUsIHVuc2lnbmVkIGludCBvZmZzZXQsDQo+ID4gIAkJcmV0dXJuIG1taW9faW5m
by0+cmVhZCh2Z3B1LCBvZmZzZXQsIHBkYXRhLCBieXRlcyk7DQo+ID4gIAllbHNlIHsNCj4gPiAg
CQl1NjQgcm9fbWFzayA9IG1taW9faW5mby0+cm9fbWFzazsNCj4gPiAtCQl1MzIgb2xkX3ZyZWcg
PSAwLCBvbGRfc3JlZyA9IDA7DQo+ID4gKwkJdTMyIG9sZF92cmVnID0gMDsNCj4gPiAgCQl1NjQg
ZGF0YSA9IDA7DQo+ID4NCj4gPiAgCQlpZiAoaW50ZWxfZ3Z0X21taW9faGFzX21vZGVfbWFzayhn
dnQsIG1taW9faW5mby0+b2Zmc2V0KSkgew0KPiA+ICAJCQlvbGRfdnJlZyA9IHZncHVfdnJlZyh2
Z3B1LCBvZmZzZXQpOw0KPiA+IC0JCQlvbGRfc3JlZyA9IHZncHVfc3JlZyh2Z3B1LCBvZmZzZXQp
Ow0KPiA+ICAJCX0NCj4gPg0KPiA+ICAJCWlmIChsaWtlbHkoIXJvX21hc2spKQ0KPiA+IEBAIC0z
NTE2LDggKzM1MTUsNiBAQCBpbnQgaW50ZWxfdmdwdV9tbWlvX3JlZ19ydyhzdHJ1Y3QgaW50ZWxf
dmdwdQ0KPiA+ICp2Z3B1LCB1bnNpZ25lZCBpbnQgb2Zmc2V0LA0KPiA+DQo+ID4gIAkJCXZncHVf
dnJlZyh2Z3B1LCBvZmZzZXQpID0gKG9sZF92cmVnICYgfm1hc2spDQo+ID4gIAkJCQkJfCAodmdw
dV92cmVnKHZncHUsIG9mZnNldCkgJiBtYXNrKTsNCj4gPiAtCQkJdmdwdV9zcmVnKHZncHUsIG9m
ZnNldCkgPSAob2xkX3NyZWcgJiB+bWFzaykNCj4gPiAtCQkJCQl8ICh2Z3B1X3NyZWcodmdwdSwg
b2Zmc2V0KSAmIG1hc2spOw0KPiA+ICAJCX0NCj4gPiAgCX0NCj4gPg0KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvbW1pby5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndnQvbW1pby5jIGluZGV4IGVkNGRmMmY2ZDYwYi4uZjQzZDI3MDA1YmU2DQo+ID4gMTAw
NjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21taW8uYw0KPiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9tbWlvLmMNCj4gPiBAQCAtMjM5LDcgKzIzOSw2IEBA
IHZvaWQgaW50ZWxfdmdwdV9yZXNldF9tbWlvKHN0cnVjdCBpbnRlbF92Z3B1DQo+ID4gKnZncHUs
IGJvb2wgZG1scikNCj4gPg0KPiA+ICAJaWYgKGRtbHIpIHsNCj4gPiAgCQltZW1jcHkodmdwdS0+
bW1pby52cmVnLCBtbWlvLCBpbmZvLT5tbWlvX3NpemUpOw0KPiA+IC0JCW1lbWNweSh2Z3B1LT5t
bWlvLnNyZWcsIG1taW8sIGluZm8tPm1taW9fc2l6ZSk7DQo+ID4NCj4gPiAgCQl2Z3B1X3ZyZWdf
dCh2Z3B1LCBHRU42X0dUX1RIUkVBRF9TVEFUVVNfUkVHKSA9IDA7DQo+ID4NCj4gPiBAQCAtMjgw
LDcgKzI3OSw2IEBAIHZvaWQgaW50ZWxfdmdwdV9yZXNldF9tbWlvKHN0cnVjdCBpbnRlbF92Z3B1
DQo+ID4gKnZncHUsIGJvb2wgZG1scikNCj4gPiAgCQkgKiB0b3VjaGVkDQo+ID4gIAkJICovDQo+
ID4gIAkJbWVtY3B5KHZncHUtPm1taW8udnJlZywgbW1pbywNCj4gPiBHVlRfR0VOOF9NTUlPX1JF
U0VUX09GRlNFVCk7DQo+ID4gLQkJbWVtY3B5KHZncHUtPm1taW8uc3JlZywgbW1pbywNCj4gPiBH
VlRfR0VOOF9NTUlPX1JFU0VUX09GRlNFVCk7DQo+ID4gIAl9DQo+ID4NCj4gPiAgfQ0KPiA+IEBA
IC0yOTYsMTIgKzI5NCwxMCBAQCBpbnQgaW50ZWxfdmdwdV9pbml0X21taW8oc3RydWN0IGludGVs
X3ZncHUNCj4gPiAqdmdwdSkgIHsNCj4gPiAgCWNvbnN0IHN0cnVjdCBpbnRlbF9ndnRfZGV2aWNl
X2luZm8gKmluZm8gPSAmdmdwdS0+Z3Z0LT5kZXZpY2VfaW5mbzsNCj4gPg0KPiA+IC0JdmdwdS0+
bW1pby52cmVnID0gdnphbGxvYyhhcnJheV9zaXplKGluZm8tPm1taW9fc2l6ZSwgMikpOw0KPiA+
ICsJdmdwdS0+bW1pby52cmVnID0gdnphbGxvYyhhcnJheV9zaXplKGluZm8tPm1taW9fc2l6ZSwg
MSkpOw0KPiBXaHkgZG9uJ3QgeW91IHVzZSB2emFsbG9jKGluZm8tPm1taW9fc2l6ZSkgZGlyZWN0
bHk/DQoNClllcywgc2hvdWxkIHVzZSB2emFsbG9jIGRpcmVjdGx5IG5vdy4gVGhhbmtzOikNCg0K
IA0KDQo+ID4gIAlpZiAoIXZncHUtPm1taW8udnJlZykNCj4gPiAgCQlyZXR1cm4gLUVOT01FTTsN
Cj4gPg0KPiA+IC0JdmdwdS0+bW1pby5zcmVnID0gdmdwdS0+bW1pby52cmVnICsgaW5mby0+bW1p
b19zaXplOw0KPiA+IC0NCj4gPiAgCWludGVsX3ZncHVfcmVzZXRfbW1pbyh2Z3B1LCB0cnVlKTsN
Cj4gPg0KPiA+ICAJcmV0dXJuIDA7DQo+ID4gQEAgLTMxNSw1ICszMTEsNSBAQCBpbnQgaW50ZWxf
dmdwdV9pbml0X21taW8oc3RydWN0IGludGVsX3ZncHUgKnZncHUpDQo+ID4gdm9pZCBpbnRlbF92
Z3B1X2NsZWFuX21taW8oc3RydWN0IGludGVsX3ZncHUgKnZncHUpICB7DQo+ID4gIAl2ZnJlZSh2
Z3B1LT5tbWlvLnZyZWcpOw0KPiA+IC0JdmdwdS0+bW1pby52cmVnID0gdmdwdS0+bW1pby5zcmVn
ID0gTlVMTDsNCj4gPiArCXZncHUtPm1taW8udnJlZyA9IE5VTEw7DQo+ID4gIH0NCj4gPiAtLQ0K
PiA+IDIuMTcuMQ0KPiA+DQo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18NCj4gPiBpbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdA0KPiA+IGludGVsLWd2
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2DQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdApp
bnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
