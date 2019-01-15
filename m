Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp4044127ywd;
        Tue, 15 Jan 2019 02:55:57 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5IkqBp4xtLdPQqeMLkBvLQofivwLSL/aMi/kKM54QnhYjxrHtKpUnRGgcwuMfl68GmMrtB
X-Received: by 2002:a17:902:28c1:: with SMTP id f59mr3461789plb.37.1547549757729;
        Tue, 15 Jan 2019 02:55:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547549757; cv=none;
        d=google.com; s=arc-20160816;
        b=mZi3/2KDBrQJ2HlMYgG+tSyo9YwjwuRHSdJcMFLv91BUXZCi29VUex92u5Fy6oSKzD
         H2UWrKKRffW0o/iGrx4R1HBhkQMieYjC4i+6sK3C8sjzVgWHiiJrqfv9+NE+7I/ZxI4u
         pS0/6ra2hXrT5My3Jq22m0rdvb1PZmVTRLkqc+YV99wHv0rUHABgxpIddYrf3CewuUW1
         n7oRcOp5MWNQgtduj8YSP+D13TqyNUGOBghiRArVzhJAuhugC5G6cKVl6xJSZaP40g/J
         Yj99j7PGqmDKJIybLjMHxk42vqjjaypYmQmeH+sRQkeCOtavP+5G2eHgMAMgrB9Tjra4
         1rYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:dlp-reaction:dlp-version:dlp-product
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:to:from:delivered-to;
        bh=mggAPpSEwnJmAsL8dfjpU6aPuYNv79nCJs10YBkZViE=;
        b=HYfXfEf0Tso+ZwRI/k8ej4XkDfMLjxQxuEAzcbutFmlhpbd1CyLcsTCjpPi1CPEyMv
         PNnbZxZVT+g1sqrNcsvm+5JU2kREH5MrejGP368HfizXW+Zujh/Bg8EmBlszsycYi3EC
         a64twr2YbS62URdPrz0Mk+d2f23WUYA0sdAY37XPfp2h736BiDPPOKxX+x617xdWCNwU
         Z2yqGvQTvDKRtkgMHexdRCLkqHE0n6Pw4HVIIkj1Nq9lUjSXVEBsn3J1iAi+SyTfmfRc
         tsr2QEJ6QWdIDUjnR2SkuBswPOTjAt09IimFjcsjRYlZkgSW+NFxuMiA8B5FhTr6JPaI
         K7Iw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id 204si1441601pfu.273.2019.01.15.02.55.57
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Jan 2019 02:55:57 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E63A26EC96;
	Tue, 15 Jan 2019 10:55:56 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 717B06EC96
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 15 Jan 2019 10:55:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Jan 2019 02:55:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,481,1539673200"; d="scan'208";a="138415007"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by fmsmga001.fm.intel.com with ESMTP; 15 Jan 2019 02:55:55 -0800
Received: from FMSMSX110.amr.corp.intel.com (10.18.116.10) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Tue, 15 Jan 2019 02:55:55 -0800
Received: from shsmsx101.ccr.corp.intel.com (10.239.4.153) by
 fmsmsx110.amr.corp.intel.com (10.18.116.10) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Tue, 15 Jan 2019 02:55:54 -0800
Received: from shsmsx103.ccr.corp.intel.com ([169.254.4.150]) by
 SHSMSX101.ccr.corp.intel.com ([169.254.1.196]) with mapi id 14.03.0415.000;
 Tue, 15 Jan 2019 18:55:52 +0800
From: "Yuan, Hang" <hang.yuan@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915/gvt: Fix mmap range check
Thread-Topic: [PATCH] drm/i915/gvt: Fix mmap range check
Thread-Index: AQHUqXK/4uN5l47r1Uu0hBOTaCqpO6WwLqjg
Date: Tue, 15 Jan 2019 10:55:51 +0000
Message-ID: <C294FBAE55175941838A8D362DCD8AA225E91547@SHSMSX103.ccr.corp.intel.com>
References: <20190111055853.1943-1-zhenyuw@linux.intel.com>
In-Reply-To: <20190111055853.1943-1-zhenyuw@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYmM0N2Y1MjItOTg2Yi00MGNmLWIxNmUtYzg0ZWQzZTAxMDMwIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoic1FJdVpUYlhCN0RIQlcyWmJsWHlqbFhRU1NtTTVYTzBKUUo5am1PNzhXcTNaSExFU0g5YWFnQzNHQU01aWZSMiJ9
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
Cc: "Monroy, Rodrigo Axel" <rodrigo.axel.monroy@intel.com>, "Orrala
 Contreras, Alfredo" <alfredo.orrala.contreras@intel.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

TG9va3MgZmluZSB0byBtZS4gVGhhbmtzLg0KDQpSZXZpZXdlZC1ieTogSGFuZyBZdWFuIDxoYW5n
Lnl1YW5AaW50ZWwuY29tPg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IGludGVsLWd2dC1kZXYgW21haWx0bzppbnRlbC1ndnQtZGV2LWJvdW5jZXNAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnXSBPbg0KPiBCZWhhbGYgT2YgWmhlbnl1IFdhbmcNCj4gU2VudDogRnJpZGF5LCBK
YW51YXJ5IDExLCAyMDE5IDE6NTkgUE0NCj4gVG86IGludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQo+IENjOiBNb25yb3ksIFJvZHJpZ28gQXhlbCA8cm9kcmlnby5heGVsLm1vbnJv
eUBpbnRlbC5jb20+OyBPcnJhbGENCj4gQ29udHJlcmFzLCBBbGZyZWRvIDxhbGZyZWRvLm9ycmFs
YS5jb250cmVyYXNAaW50ZWwuY29tPjsNCj4gc3RhYmxlQHZnZXIua2VybmVsLm9yZw0KPiBTdWJq
ZWN0OiBbUEFUQ0hdIGRybS9pOTE1L2d2dDogRml4IG1tYXAgcmFuZ2UgY2hlY2sNCj4gDQo+IFRo
aXMgaXMgdG8gZml4IG1pc3NlZCBtbWFwIHJhbmdlIGNoZWNrIG9uIHZHUFUgYmFyMiByZWdpb24g
YW5kIG9ubHkgYWxsb3cNCj4gdG8gbWFwIHZHUFUgYWxsb2NhdGVkIEdNQUREUiByYW5nZSwgd2hp
Y2ggbWVhbnMgdXNlciBzcGFjZSBzaG91bGQNCj4gc3VwcG9ydCBzcGFyc2UgbW1hcCB0byBnZXQg
cHJvcGVyIG9mZnNldCBmb3IgbW1hcCB2R1BVIGFwZXJ0dXJlLiBBbmQNCj4gdGhpcyB0YWtlcyBj
YXJlIG9mIGFjdHVhbCBwZ29mZiBpbiBtbWFwIHJlcXVlc3QgYXMgb3JpZ2luYWwgY29kZSBhbHdh
eXMgZG9lcw0KPiBmcm9tIGJlZ2lubmluZyBvZiB2R1BVIGFwZXJ0dXJlLg0KPiANCj4gRml4ZXM6
IDY1OTY0M2Y3ZDgxNCAoImRybS9pOTE1L2d2dC9rdm1ndDogYWRkIHZmaW8vbWRldiBzdXBwb3J0
IHRvDQo+IEtWTUdUIikNCj4gQ2M6ICJNb25yb3ksIFJvZHJpZ28gQXhlbCIgPHJvZHJpZ28uYXhl
bC5tb25yb3lAaW50ZWwuY29tPg0KPiBDYzogIk9ycmFsYSBDb250cmVyYXMsIEFsZnJlZG8iIDxh
bGZyZWRvLm9ycmFsYS5jb250cmVyYXNAaW50ZWwuY29tPg0KPiBDYzogc3RhYmxlQHZnZXIua2Vy
bmVsLm9yZyAjIHY0LjEwKw0KPiBTaWduZWQtb2ZmLWJ5OiBaaGVueXUgV2FuZyA8emhlbnl1d0Bs
aW51eC5pbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2t2bWd0
LmMgfCAxNCArKysrKysrKysrKystLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3Z0L2t2bWd0LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQva3ZtZ3QuYw0KPiBp
bmRleCBhMTllNjg0ZTYyMWEuLjU0ODhjMmUyYTNmZiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3Z0L2t2bWd0LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0
L2t2bWd0LmMNCj4gQEAgLTEwMDUsNyArMTAwNSw3IEBAIHN0YXRpYyBpbnQgaW50ZWxfdmdwdV9t
bWFwKHN0cnVjdCBtZGV2X2RldmljZQ0KPiAqbWRldiwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2
bWEpICB7DQo+ICAJdW5zaWduZWQgaW50IGluZGV4Ow0KPiAgCXU2NCB2aXJ0YWRkcjsNCj4gLQl1
bnNpZ25lZCBsb25nIHJlcV9zaXplLCBwZ29mZiA9IDA7DQo+ICsJdW5zaWduZWQgbG9uZyByZXFf
c2l6ZSwgcGdvZmYsIHJlcV9zdGFydDsNCj4gIAlwZ3Byb3RfdCBwZ19wcm90Ow0KPiAgCXN0cnVj
dCBpbnRlbF92Z3B1ICp2Z3B1ID0gbWRldl9nZXRfZHJ2ZGF0YShtZGV2KTsNCj4gDQo+IEBAIC0x
MDIzLDcgKzEwMjMsMTcgQEAgc3RhdGljIGludCBpbnRlbF92Z3B1X21tYXAoc3RydWN0IG1kZXZf
ZGV2aWNlDQo+ICptZGV2LCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkNCj4gIAlwZ19wcm90
ID0gdm1hLT52bV9wYWdlX3Byb3Q7DQo+ICAJdmlydGFkZHIgPSB2bWEtPnZtX3N0YXJ0Ow0KPiAg
CXJlcV9zaXplID0gdm1hLT52bV9lbmQgLSB2bWEtPnZtX3N0YXJ0Ow0KPiAtCXBnb2ZmID0gdmdw
dV9hcGVydHVyZV9wYV9iYXNlKHZncHUpID4+IFBBR0VfU0hJRlQ7DQo+ICsJcGdvZmYgPSB2bWEt
PnZtX3Bnb2ZmICYNCj4gKwkJKCgxVSA8PCAoVkZJT19QQ0lfT0ZGU0VUX1NISUZUIC0gUEFHRV9T
SElGVCkpIC0gMSk7DQo+ICsJcmVxX3N0YXJ0ID0gcGdvZmYgPDwgUEFHRV9TSElGVDsNCj4gKw0K
PiArCWlmICghaW50ZWxfdmdwdV9pbl9hcGVydHVyZSh2Z3B1LCByZXFfc3RhcnQpKQ0KPiArCQly
ZXR1cm4gLUVJTlZBTDsNCj4gKwlpZiAocmVxX3N0YXJ0ICsgcmVxX3NpemUgPg0KPiArCSAgICB2
Z3B1X2FwZXJ0dXJlX29mZnNldCh2Z3B1KSArIHZncHVfYXBlcnR1cmVfc3oodmdwdSkpDQo+ICsJ
CXJldHVybiAtRUlOVkFMOw0KPiArDQo+ICsJcGdvZmYgPSAoZ3Z0X2FwZXJ0dXJlX3BhX2Jhc2Uo
dmdwdS0+Z3Z0KSA+PiBQQUdFX1NISUZUKSArIHBnb2ZmOw0KPiANCj4gIAlyZXR1cm4gcmVtYXBf
cGZuX3JhbmdlKHZtYSwgdmlydGFkZHIsIHBnb2ZmLCByZXFfc2l6ZSwgcGdfcHJvdCk7ICB9DQo+
IC0tDQo+IDIuMTkuMQ0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18NCj4gaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QNCj4gaW50ZWwtZ3Z0LWRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2DQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1n
dnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXYK
