Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp2381032ywo;
        Tue, 2 Apr 2019 23:09:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxhAFAcSZiUw/04nq7+ORY6foqQ23aaf9R9CJkqOS5zjhFXXZUHy7dP2a0sXSOjEaFuDSpG
X-Received: by 2002:a62:a513:: with SMTP id v19mr16556928pfm.212.1554271785763;
        Tue, 02 Apr 2019 23:09:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554271785; cv=none;
        d=google.com; s=arc-20160816;
        b=jaEVEcFXigi7APcKZx6poiFsM+WopwcXq27FYDNTG/fLx2AmEyhzKVrI6g/1MctEYQ
         naxS5INkwwGn1nLd32NgUgL8ThxfwA3fAO3rlG3fPerGJppwybwoQCO92W6+JtCzT1sb
         6Sa7oCx5M3TzBVggRTUvHx5ZBS5HncwJ2KU2VEwr2T+y/gqsyU+5SnfnuGUu68JWQ366
         VCIqW+XaKWFjuwMEh87aIoKTCjuwzoBcCOlWxvN8gbyIyMiT1kzXpwndxA3cVr95/Kfk
         YPRudrRQa2Tkx1k6rDQX11ZGraI+5AspnwvSlfaA+mDsxRS3BnIRn+q25ELxgdrJMrKc
         GJlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:dlp-reaction:dlp-version:dlp-product
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:to:from:delivered-to;
        bh=XAME0AzIbC7YRUjU2ijTR6VroMxsPvMrEoj7tADEd7E=;
        b=cMZuZ3T8r+oClwpu4XJrlvF5K8qJVuKieA8GJ6qPdTApV9AfsttryDfyun83xx9kBU
         vt0z5G1Z1RkbMVj6qPD0uLPHqo74BioMyef0ky17ZN+x1GOVf1d2uK56r+U71sKvYpXi
         nlf6uq/TlGQO+m7onQXIEX/UhRZ/7/VLMJeu+5f/MaRDs0epXv4ZoLH47DHfp/ppFaaS
         klp9sfTD0uthcKfdIiY/W6/ptHgbqYn5UnkDeqtgWXJ75OTxuaRmrgkk0Il2gQM2jzk0
         guNZe+9lo7XcG9NrBnQsj5w2ZpXKuPwHFd0RY+W6STgj4Mpmco5XNC7ZryltwQuucW09
         1NfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id a1si7124818pgd.394.2019.04.02.23.09.45
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Apr 2019 23:09:45 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F8666E81C;
	Wed,  3 Apr 2019 06:09:45 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C27F6E81C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  3 Apr 2019 06:09:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Apr 2019 23:09:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,303,1549958400"; d="scan'208";a="137143832"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by fmsmga008.fm.intel.com with ESMTP; 02 Apr 2019 23:09:43 -0700
Received: from fmsmsx119.amr.corp.intel.com (10.18.124.207) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Tue, 2 Apr 2019 23:09:43 -0700
Received: from shsmsx153.ccr.corp.intel.com (10.239.6.53) by
 FMSMSX119.amr.corp.intel.com (10.18.124.207) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Tue, 2 Apr 2019 23:09:42 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.92]) by
 SHSMSX153.ccr.corp.intel.com ([169.254.12.139]) with mapi id 14.03.0415.000;
 Wed, 3 Apr 2019 14:09:40 +0800
From: "Yuan, Hang" <hang.yuan@intel.com>
To: "Zhang, Xiaolin" <xiaolin.zhang@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Subject: RE: [PATCH V2] drm/i915/gvt: addressed guest GPU hang with HWS
 index mode
Thread-Topic: [PATCH V2] drm/i915/gvt: addressed guest GPU hang with HWS
 index mode
Thread-Index: AQHU6dm4Z0qqo9Hhr0eap4ZhRrsg26Yp88PA
Date: Wed, 3 Apr 2019 06:09:39 +0000
Message-ID: <C294FBAE55175941838A8D362DCD8AA225ECCD8F@SHSMSX104.ccr.corp.intel.com>
References: <20190403050046.16601-1-xiaolin.zhang@intel.com>
In-Reply-To: <20190403050046.16601-1-xiaolin.zhang@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOWY4ZDNiZDctNTI0OC00ZTM0LWI3ZWYtMDFlZTZlNWJhMjU1IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiZ0ZHU3RqVjVnbEJcL3NyOFBNbE44U0pOaGpaUnREZFZmcDRrNndLY1c2VzdRUVk2XC9PRlVkTlNmazA3UXBqXC9MRiJ9
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
YWxmIE9mIFhpYW9saW4gWmhhbmcNCj4gU2VudDogV2VkbmVzZGF5LCBBcHJpbCAzLCAyMDE5IDE6
MDEgUE0NCj4gVG86IGludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBa
aGFuZywgWGlhb2xpbiA8eGlhb2xpbi56aGFuZ0BpbnRlbC5jb20+OyB6aGVueXV3QGxpbnV4Lmlu
dGVsLmNvbQ0KPiBTdWJqZWN0OiBbUEFUQ0ggVjJdIGRybS9pOTE1L2d2dDogYWRkcmVzc2VkIGd1
ZXN0IEdQVSBoYW5nIHdpdGggSFdTDQo+IGluZGV4IG1vZGUNCj4gDQo+IHdpdGggdGhlIGludHJv
ZHVjZSBvZiAic3dpdGNoIHRvIHVzZSBIV1MgaW5kaWNlcyByYXRoZXIgdGhhbiBhZGRyZXNzIiwg
Z3Vlc3QNCj4gR1BVIGhhbmcgb2JzZXJ2ZWQgd2hlbiBydW5uaW5nIHdvcmtsb2FkcyB3aGljaCB3
aWxsIHVwZGF0ZSB0aGUgc2Vxbm8gdG8NCj4gdGhlIHJlYWwgSFcgSFdTUCwgbm90IHZpdHVyYWwg
R1BVIEhXU1AgYW5kIHRoZW4gY2F1c2UgR1BVIGhhbmcuDQo+IA0KPiB0aGlzIHBhdGNoIGlzIHRv
IHJldm9rZSBpbmRleCBtb2RlIGluIFBJUEVfQ1RSTCBhbmQgTUlfRkxVU0hfRFcgYW5kDQo+IHBh
dGNoIGd1ZXN0IEdQVSBIV1NQIGFkZHJlc3MgdmFsdWUgdG8gdGhlc2UgY29tbWFuZHMuDQo+IA0K
PiBGaXhlczogNTQ5MzllYTBiKCJkcm0vaTkxNTogU3dpdGNoIHRvIHVzZSBIV1MgaW5kaWNlcyBy
YXRoZXIgdGhhbg0KPiBhZGRyZXNzZXMiKQ0KPiANCj4gdjI6IFBJUEVfQ1RSTCBhbmQgTUlfRkxV
U0hfRFcgaGFzIGRpZmZlcmVudCBhZGRyZXNzIG9mZnNldCwgb2Zmc2V0IGlzIGFsc28NCj4gcGFz
c2VkIGZvciBnbWEgYWRkcmVzcyB1cGRhdGUuIDx6aGVueXU+DQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBYaWFvbGluIFpoYW5nIDx4aWFvbGluLnpoYW5nQGludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvY21kX3BhcnNlci5jIHwgMjUgKysrKysrKysrKysrKysrKysr
KysrKy0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJz
ZXIuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9jbWRfcGFyc2VyLmMNCj4gaW5kZXgg
YjQyMDkxOTI3OWM3Li4yNzE2ZmQzNDllY2MgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d2dC9jbWRfcGFyc2VyLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0
L2NtZF9wYXJzZXIuYw0KPiBAQCAtMTA3MCw2ICsxMDcwLDE4IEBAIHN0YXRpYyBzdHJ1Y3QgY21k
X2ludGVycnVwdF9ldmVudA0KPiBjbWRfaW50ZXJydXB0X2V2ZW50c1tdID0gew0KPiAgCX0sDQo+
ICB9Ow0KPiANCj4gK3N0YXRpYyBpbnQgaW5kZXhfbW9kZV90b19nbWEoc3RydWN0IHBhcnNlcl9l
eGVjX3N0YXRlICpzLCB1MzIgb2Zmc2V0LA0KPiArdTMyIGluZGV4KSB7DQo+ICsJdTMyIGdtYTsN
Cj4gKwl1MzIgdmFsOw0KPiArDQo+ICsJZ21hID0gcy0+dmdwdS0+aHdzX3BnYVtzLT5yaW5nX2lk
XSArIGluZGV4Ow0KW1l1YW4sIEhhbmddIHRoZSBkZXN0aW5hdGlvbiBhZGRyZXNzIG1heSBiZSBp
biBHR1RULCBkb2VzIGdsb2JhbCBoYXJkd2FyZSBzdGF0dXMgcGFnZSBuZWVkIHRvIGJlIGNvbnNp
ZGVyZWQgaGVyZT8NCg0KPiArCXBhdGNoX3ZhbHVlKHMsIGNtZF9wdHIocywgb2Zmc2V0KSwgZ21h
KTsNCj4gKwl2YWwgPSBjbWRfdmFsKHMsIG9mZnNldCAtIDEpICYgKH5QSVBFX0NPTlRST0xfU1RP
UkVfREFUQV9JTkRFWCk7DQo+ICsJcGF0Y2hfdmFsdWUocywgY21kX3B0cihzLCBvZmZzZXQgLSAx
KSwgdmFsKTsNCj4gKwlyZXR1cm4gMDsNCj4gK30NCj4gKw0KPiAgc3RhdGljIGludCBjbWRfaGFu
ZGxlcl9waXBlX2NvbnRyb2woc3RydWN0IHBhcnNlcl9leGVjX3N0YXRlICpzKSAgew0KPiAgCWlu
dCBnbWFkcl9ieXRlcyA9IHMtPnZncHUtPmd2dC0+ZGV2aWNlX2luZm8uZ21hZHJfYnl0ZXNfaW5f
Y21kOw0KPiBAQCAtMTA5OCw4ICsxMTEwLDExIEBAIHN0YXRpYyBpbnQgY21kX2hhbmRsZXJfcGlw
ZV9jb250cm9sKHN0cnVjdA0KPiBwYXJzZXJfZXhlY19zdGF0ZSAqcykNCj4gIAkJCQkvKiBTdG9y
ZSBEYXRhIEluZGV4ICovDQo+ICAJCQkJaWYgKGNtZF92YWwocywgMSkgJiAoMSA8PCAyMSkpDQo+
ICAJCQkJCWluZGV4X21vZGUgPSB0cnVlOw0KPiAtCQkJCXJldCB8PSBjbWRfYWRkcmVzc19hdWRp
dChzLCBnbWEsIHNpemVvZih1NjQpLA0KPiAtCQkJCQkJaW5kZXhfbW9kZSk7DQo+ICsJCQkJaWYg
KGluZGV4X21vZGUpDQo+ICsJCQkJCXJldCA9IGluZGV4X21vZGVfdG9fZ21hKHMsIDIsIGdtYSk7
DQo+ICsJCQkJZWxzZQ0KPiArCQkJCQlyZXQgfD0gY21kX2FkZHJlc3NfYXVkaXQocywgZ21hLA0K
PiArCQkJCQkJc2l6ZW9mKHU2NCksIGluZGV4X21vZGUpOw0KPiAgCQkJfQ0KPiAgCQl9DQo+ICAJ
fQ0KPiBAQCAtMTYwNyw3ICsxNjIyLDExIEBAIHN0YXRpYyBpbnQgY21kX2hhbmRsZXJfbWlfZmx1
c2hfZHcoc3RydWN0DQo+IHBhcnNlcl9leGVjX3N0YXRlICpzKQ0KPiAgCQkvKiBTdG9yZSBEYXRh
IEluZGV4ICovDQo+ICAJCWlmIChjbWRfdmFsKHMsIDApICYgKDEgPDwgMjEpKQ0KPiAgCQkJaW5k
ZXhfbW9kZSA9IHRydWU7DQo+IC0JCXJldCA9IGNtZF9hZGRyZXNzX2F1ZGl0KHMsIGdtYSwgc2l6
ZW9mKHU2NCksIGluZGV4X21vZGUpOw0KPiArCQlpZiAoaW5kZXhfbW9kZSkNCj4gKwkJCXJldCA9
IGluZGV4X21vZGVfdG9fZ21hKHMsIDEsIGdtYSk7DQo+ICsJCWVsc2UNCj4gKwkJCXJldCA9IGNt
ZF9hZGRyZXNzX2F1ZGl0KHMsIGdtYSwNCj4gKwkJCQkJc2l6ZW9mKHU2NCksIGluZGV4X21vZGUp
Ow0KPiAgCX0NCj4gIAkvKiBDaGVjayBub3RpZnkgYml0ICovDQo+ICAJaWYgKChjbWRfdmFsKHMs
IDApICYgKDEgPDwgOCkpKQ0KPiAtLQ0KPiAyLjE1LjENCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVs
LWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
