Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp7721188ywe;
        Thu, 7 Mar 2019 23:45:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqw3imRcNM8Gn0Ggrt+nmsIE4OchruuFqqJefKi/N79oiebifyyxkGRjeCiF+1LgyMB6+h0Q
X-Received: by 2002:a65:40c5:: with SMTP id u5mr15259929pgp.275.1552031131832;
        Thu, 07 Mar 2019 23:45:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552031131; cv=none;
        d=google.com; s=arc-20160816;
        b=XuNi4Wbrro/H99Hp8EBhvDjcJ3bd5sjwLXY5KiXix3mu7vuQjpApBGjpbVPA81zv/F
         RcSONZZrgj3giNoCdknMvtamxrIpAN2Ntb8agtpRHdRpJ/wMtuw4LMmEJ0L7VZAkGuRJ
         3QQglZDxceqm3N8C4sVOibRoUSyoMhQ/bQgxZQnmFDaW9y96MVeNK+z6OEIpo2rRWVgQ
         JIqtVndeCiylVfrlCk7EU067qqBzmCQ0vtUbRtXyHgabkUrSbeWWXM+p0IA1bfV6mZ+I
         8SyuFt9RAat+JsPmnR/vzVTIEdz3A0tmyJackm6OQKTXqPXLFfm31lYFtJgC+E2j99Da
         GIgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:dlp-reaction:dlp-version:dlp-product
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:to:from:delivered-to;
        bh=OH17t84o7P1Co3cFj2kHN3VrOlUfRH/MRHsBKI+OjFE=;
        b=avM+JGChJ7PI90e5MfICmSpbsFYcvJjFFvwQMoWr2PYDA8WD57F8t3RPmPxJcreTWn
         RXIbUbODhVgg4KeyYNDfivGkDgU7LyENYF56/46l6JwvYf/AondSLjm1Hy1hQZOqxSkE
         c2f3QVii4JNw+G/2QLNiUnvBe04iabKLkApXNgHgqbvQe3Mo8QMEpYbtKTJ8fviRD1ey
         zSiK+KGlswuOXcSoB3yhgsjsLfn9oxbh2ztv+tT5OE/jlItejpipzfyL1+BI3cq+uCWi
         8bwWO63UtW9ZfhJSKTfaBK3YmoVUNhKBQpMtwpWTbsjtWLCzKreA9wkzo5jg3yJCYb6d
         zPdg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id c2si6092714pfd.113.2019.03.07.23.45.31
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Mar 2019 23:45:31 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1908C892E6;
	Fri,  8 Mar 2019 07:45:31 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB74892E6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  8 Mar 2019 07:45:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Mar 2019 23:45:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,455,1544515200"; d="scan'208";a="139076644"
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
 by FMSMGA003.fm.intel.com with ESMTP; 07 Mar 2019 23:45:29 -0800
Received: from fmsmsx114.amr.corp.intel.com (10.18.116.8) by
 fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 7 Mar 2019 23:45:29 -0800
Received: from shsmsx107.ccr.corp.intel.com (10.239.4.96) by
 FMSMSX114.amr.corp.intel.com (10.18.116.8) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 7 Mar 2019 23:45:29 -0800
Received: from shsmsx103.ccr.corp.intel.com ([169.254.4.134]) by
 SHSMSX107.ccr.corp.intel.com ([169.254.9.252]) with mapi id 14.03.0415.000;
 Fri, 8 Mar 2019 15:45:27 +0800
From: "He, Min" <min.he@intel.com>
To: "Zhao, Yan Y" <yan.y.zhao@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Subject: RE: [PATCH v2] drm/i915/gvt: remove the unused sreg
Thread-Topic: [PATCH v2] drm/i915/gvt: remove the unused sreg
Thread-Index: AQHU1YEjE4wMFPJ5vUi/rEmVs+mKRqYBWkhg
Date: Fri, 8 Mar 2019 07:45:27 +0000
Message-ID: <B8F3B07A09E6B84F88EAD83F055E9945519CB311@SHSMSX103.ccr.corp.intel.com>
References: <20190308072651.27063-1-yan.y.zhao@intel.com>
In-Reply-To: <20190308072651.27063-1-yan.y.zhao@intel.com>
Accept-Language: en-US
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
Cc: "Zhao, Yan Y" <yan.y.zhao@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaW50ZWwtZ3Z0LWRldiBb
bWFpbHRvOmludGVsLWd2dC1kZXYtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmddIE9uDQo+
IEJlaGFsZiBPZiBZYW4gWmhhbw0KPiBTZW50OiBGcmlkYXksIE1hcmNoIDgsIDIwMTkgMzoyNyBQ
TQ0KPiBUbzogaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IFpoYW8s
IFlhbiBZIDx5YW4ueS56aGFvQGludGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIHYyXSBkcm0v
aTkxNS9ndnQ6IHJlbW92ZSB0aGUgdW51c2VkIHNyZWcNCj4gDQo+IGNvZGUgY2xlYW51cC4gc3Jl
ZyBpcyBub3QgdXNlZCBub3cuIHJlbW92ZSBpdCBmb3IgY29kZSBjbGVhbm5lc3MuDQo+IA0KPiB2
MjogZG8gbm90IGFsbG9jYXRlIG1lbW9yeSBmb3Igc3JlZy4gKG1pbiBoZSkNCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IFlhbiBaaGFvIDx5YW4ueS56aGFvQGludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3Z0LmggICAgICB8IDUgLS0tLS0NCj4gIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2d2dC9oYW5kbGVycy5jIHwgNSArLS0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3Z0L21taW8uYyAgICAgfCA4ICsrLS0tLS0tDQo+ICAzIGZpbGVzIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3Z0L2d2dC5oIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d2dC5oDQo+
IGluZGV4IGVmNzEwZTI1OTcyNi4uYTRmZDk3OWIzZGFkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndnQvZ3Z0LmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0
L2d2dC5oDQo+IEBAIC05NCw3ICs5NCw2IEBAIHN0cnVjdCBpbnRlbF92Z3B1X2ZlbmNlIHsNCj4g
DQo+ICBzdHJ1Y3QgaW50ZWxfdmdwdV9tbWlvIHsNCj4gIAl2b2lkICp2cmVnOw0KPiAtCXZvaWQg
KnNyZWc7DQo+ICB9Ow0KPiANCj4gICNkZWZpbmUgSU5URUxfR1ZUX01BWF9CQVJfTlVNIDQNCj4g
QEAgLTQ0NywxMCArNDQ2LDYgQEAgdm9pZCBpbnRlbF92Z3B1X3dyaXRlX2ZlbmNlKHN0cnVjdCBp
bnRlbF92Z3B1DQo+ICp2Z3B1LA0KPiAgCSgqKHU2NCAqKSh2Z3B1LT5tbWlvLnZyZWcgKyBpOTE1
X21taW9fcmVnX29mZnNldChyZWcpKSkNCj4gICNkZWZpbmUgdmdwdV92cmVnNjQodmdwdSwgb2Zm
c2V0KSBcDQo+ICAJKCoodTY0ICopKHZncHUtPm1taW8udnJlZyArIChvZmZzZXQpKSkNCj4gLSNk
ZWZpbmUgdmdwdV9zcmVnX3QodmdwdSwgcmVnKSBcDQo+IC0JKCoodTMyICopKHZncHUtPm1taW8u
c3JlZyArIGk5MTVfbW1pb19yZWdfb2Zmc2V0KHJlZykpKQ0KPiAtI2RlZmluZSB2Z3B1X3NyZWco
dmdwdSwgb2Zmc2V0KSBcDQo+IC0JKCoodTMyICopKHZncHUtPm1taW8uc3JlZyArIChvZmZzZXQp
KSkNCj4gDQo+ICAjZGVmaW5lIGZvcl9lYWNoX2FjdGl2ZV92Z3B1KGd2dCwgdmdwdSwgaWQpIFwN
Cj4gIAlpZHJfZm9yX2VhY2hfZW50cnkoKCYoZ3Z0KS0+dmdwdV9pZHIpLCAodmdwdSksIChpZCkp
IFwNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9oYW5kbGVycy5jDQo+
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMNCj4gaW5kZXggYjVjMGFjMDQ5
MjVmLi41NGJkMGIwMzMyOTggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2
dC9oYW5kbGVycy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9oYW5kbGVycy5j
DQo+IEBAIC0zNDg5LDEyICszNDg5LDExIEBAIGludCBpbnRlbF92Z3B1X21taW9fcmVnX3J3KHN0
cnVjdCBpbnRlbF92Z3B1DQo+ICp2Z3B1LCB1bnNpZ25lZCBpbnQgb2Zmc2V0LA0KPiAgCQlyZXR1
cm4gbW1pb19pbmZvLT5yZWFkKHZncHUsIG9mZnNldCwgcGRhdGEsIGJ5dGVzKTsNCj4gIAllbHNl
IHsNCj4gIAkJdTY0IHJvX21hc2sgPSBtbWlvX2luZm8tPnJvX21hc2s7DQo+IC0JCXUzMiBvbGRf
dnJlZyA9IDAsIG9sZF9zcmVnID0gMDsNCj4gKwkJdTMyIG9sZF92cmVnID0gMDsNCj4gIAkJdTY0
IGRhdGEgPSAwOw0KPiANCj4gIAkJaWYgKGludGVsX2d2dF9tbWlvX2hhc19tb2RlX21hc2soZ3Z0
LCBtbWlvX2luZm8tPm9mZnNldCkpDQo+IHsNCj4gIAkJCW9sZF92cmVnID0gdmdwdV92cmVnKHZn
cHUsIG9mZnNldCk7DQo+IC0JCQlvbGRfc3JlZyA9IHZncHVfc3JlZyh2Z3B1LCBvZmZzZXQpOw0K
PiAgCQl9DQo+IA0KPiAgCQlpZiAobGlrZWx5KCFyb19tYXNrKSkNCj4gQEAgLTM1MTYsOCArMzUx
NSw2IEBAIGludCBpbnRlbF92Z3B1X21taW9fcmVnX3J3KHN0cnVjdCBpbnRlbF92Z3B1DQo+ICp2
Z3B1LCB1bnNpZ25lZCBpbnQgb2Zmc2V0LA0KPiANCj4gIAkJCXZncHVfdnJlZyh2Z3B1LCBvZmZz
ZXQpID0gKG9sZF92cmVnICYgfm1hc2spDQo+ICAJCQkJCXwgKHZncHVfdnJlZyh2Z3B1LCBvZmZz
ZXQpICYgbWFzayk7DQo+IC0JCQl2Z3B1X3NyZWcodmdwdSwgb2Zmc2V0KSA9IChvbGRfc3JlZyAm
IH5tYXNrKQ0KPiAtCQkJCQl8ICh2Z3B1X3NyZWcodmdwdSwgb2Zmc2V0KSAmIG1hc2spOw0KPiAg
CQl9DQo+ICAJfQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9t
bWlvLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvbW1pby5jDQo+IGluZGV4IGVkNGRm
MmY2ZDYwYi4uZjQzZDI3MDA1YmU2IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndnQvbW1pby5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9tbWlvLmMNCj4g
QEAgLTIzOSw3ICsyMzksNiBAQCB2b2lkIGludGVsX3ZncHVfcmVzZXRfbW1pbyhzdHJ1Y3QgaW50
ZWxfdmdwdSAqdmdwdSwNCj4gYm9vbCBkbWxyKQ0KPiANCj4gIAlpZiAoZG1scikgew0KPiAgCQlt
ZW1jcHkodmdwdS0+bW1pby52cmVnLCBtbWlvLCBpbmZvLT5tbWlvX3NpemUpOw0KPiAtCQltZW1j
cHkodmdwdS0+bW1pby5zcmVnLCBtbWlvLCBpbmZvLT5tbWlvX3NpemUpOw0KPiANCj4gIAkJdmdw
dV92cmVnX3QodmdwdSwgR0VONl9HVF9USFJFQURfU1RBVFVTX1JFRykgPSAwOw0KPiANCj4gQEAg
LTI4MCw3ICsyNzksNiBAQCB2b2lkIGludGVsX3ZncHVfcmVzZXRfbW1pbyhzdHJ1Y3QgaW50ZWxf
dmdwdSAqdmdwdSwNCj4gYm9vbCBkbWxyKQ0KPiAgCQkgKiB0b3VjaGVkDQo+ICAJCSAqLw0KPiAg
CQltZW1jcHkodmdwdS0+bW1pby52cmVnLCBtbWlvLA0KPiBHVlRfR0VOOF9NTUlPX1JFU0VUX09G
RlNFVCk7DQo+IC0JCW1lbWNweSh2Z3B1LT5tbWlvLnNyZWcsIG1taW8sDQo+IEdWVF9HRU44X01N
SU9fUkVTRVRfT0ZGU0VUKTsNCj4gIAl9DQo+IA0KPiAgfQ0KPiBAQCAtMjk2LDEyICsyOTQsMTAg
QEAgaW50IGludGVsX3ZncHVfaW5pdF9tbWlvKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1KQ0KPiAg
ew0KPiAgCWNvbnN0IHN0cnVjdCBpbnRlbF9ndnRfZGV2aWNlX2luZm8gKmluZm8gPSAmdmdwdS0+
Z3Z0LT5kZXZpY2VfaW5mbzsNCj4gDQo+IC0JdmdwdS0+bW1pby52cmVnID0gdnphbGxvYyhhcnJh
eV9zaXplKGluZm8tPm1taW9fc2l6ZSwgMikpOw0KPiArCXZncHUtPm1taW8udnJlZyA9IHZ6YWxs
b2MoYXJyYXlfc2l6ZShpbmZvLT5tbWlvX3NpemUsIDEpKTsNCldoeSBkb24ndCB5b3UgdXNlIHZ6
YWxsb2MoaW5mby0+bW1pb19zaXplKSBkaXJlY3RseT8gDQoNCj4gIAlpZiAoIXZncHUtPm1taW8u
dnJlZykNCj4gIAkJcmV0dXJuIC1FTk9NRU07DQo+IA0KPiAtCXZncHUtPm1taW8uc3JlZyA9IHZn
cHUtPm1taW8udnJlZyArIGluZm8tPm1taW9fc2l6ZTsNCj4gLQ0KPiAgCWludGVsX3ZncHVfcmVz
ZXRfbW1pbyh2Z3B1LCB0cnVlKTsNCj4gDQo+ICAJcmV0dXJuIDA7DQo+IEBAIC0zMTUsNSArMzEx
LDUgQEAgaW50IGludGVsX3ZncHVfaW5pdF9tbWlvKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1KQ0K
PiAgdm9pZCBpbnRlbF92Z3B1X2NsZWFuX21taW8oc3RydWN0IGludGVsX3ZncHUgKnZncHUpDQo+
ICB7DQo+ICAJdmZyZWUodmdwdS0+bW1pby52cmVnKTsNCj4gLQl2Z3B1LT5tbWlvLnZyZWcgPSB2
Z3B1LT5tbWlvLnNyZWcgPSBOVUxMOw0KPiArCXZncHUtPm1taW8udnJlZyA9IE5VTEw7DQo+ICB9
DQo+IC0tDQo+IDIuMTcuMQ0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18NCj4gaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QNCj4gaW50ZWwtZ3Z0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2DQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRl
bC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
