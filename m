Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp1304699ywd;
        Wed, 9 Jan 2019 18:51:43 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6/AQ++PP/bFh72iOc0wH27ZtSm5jS9XJTtQ02gExlWZ1sIpgN0eRja+t7Tp2csRtBBosQa
X-Received: by 2002:a62:ca9c:: with SMTP id y28mr8427929pfk.236.1547088703533;
        Wed, 09 Jan 2019 18:51:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547088703; cv=none;
        d=google.com; s=arc-20160816;
        b=qj0986rVXc6KXMCkUlTUA1zWJ0q2uWX+yHfFquUGcE/y/Ksav7YnNm+weK1mF77O8y
         RnkQkIveRTor/ZrqfjKnPAQVV2KKBahiAIRQ1TorwcJGC3DD6/Ic1wOz8Kx5HQagjYeP
         GrmCwBm2ZoUkveej9eAgSXLI0lm1BmW6DEHceMVRhuLC9WnaoV7Lh0O8sNyO2lACIlfO
         QPGRycbBPiuXwku4voyv8PkWixjbTp550gE+Ac9L2UTPM4cXWKlZGWpGp/42p43e++b4
         3H4/qKp30bgGzwuKvOEYZ3jf3pu/ICfaiOlp1+O2Xqx91WypH4FMkFeU1Mj724K/qIoT
         nPvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:dlp-reaction:dlp-version:dlp-product
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:to:from:delivered-to;
        bh=Vl9SGc0wIV8AWsXDOcltLcKSXztWQoGIEJrc8YP54fk=;
        b=AJHUJEheCW1vqs7bKaL8fgIeVmqPgC5MDUk2hz3zTX49Ra2qHne/dKpOjJOSWDfp1f
         lGz77iXiParAXen9hFIEZ3KHZVrCHkvi/uTme65bdProGt8dg8iYFGgD/sdPzh2cxVTl
         lTr6MTpOiz/LzxzloLNZB9lzYiaU6K+Ae17zu8jSjZVlAPzq6U9VgNTbinCM3hpJkMwi
         JsrW14zGCF7B9pYorhuE6529ylC1IhAuUW3LgmQVlD7eVcmE+0MUPCeJeNGwbL4A1SmM
         97HOkhCc4z7pL+bNril1/ezH/g5t4oDB38jp5zoANGbP3NzLmiRE3cjJK8Zd2F7KyZ1H
         u6Ag==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id h32si75078301pgh.276.2019.01.09.18.51.43
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Jan 2019 18:51:43 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F9BC6E639;
	Thu, 10 Jan 2019 02:51:43 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D274F6E637;
 Thu, 10 Jan 2019 02:51:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jan 2019 18:51:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,459,1539673200"; d="scan'208";a="134582730"
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
 by fmsmga004.fm.intel.com with ESMTP; 09 Jan 2019 18:51:41 -0800
Received: from fmsmsx153.amr.corp.intel.com (10.18.125.6) by
 fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 9 Jan 2019 18:51:41 -0800
Received: from shsmsx108.ccr.corp.intel.com (10.239.4.97) by
 FMSMSX153.amr.corp.intel.com (10.18.125.6) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 9 Jan 2019 18:51:40 -0800
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.63]) by
 SHSMSX108.ccr.corp.intel.com ([169.254.8.85]) with mapi id 14.03.0415.000;
 Thu, 10 Jan 2019 10:51:39 +0800
From: "Zhao, Yan Y" <yan.y.zhao@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/i915/gvt: give the cmd parser cmd_info a const
 treatment
Thread-Topic: [PATCH 2/2] drm/i915/gvt: give the cmd parser cmd_info a const
 treatment
Thread-Index: AQHUp1v0FwueVBGtGUmCh3Fare5XEKWn0AtA
Date: Thu, 10 Jan 2019 02:51:38 +0000
Message-ID: <F22B14EC3CFBB843AD3E03B6B78F2C6A4AD8145A@shsmsx102.ccr.corp.intel.com>
References: <20190108141205.17860-1-jani.nikula@intel.com>
 <20190108141205.17860-2-jani.nikula@intel.com>
In-Reply-To: <20190108141205.17860-2-jani.nikula@intel.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOGVkYzVmYTktMjIwYy00MTI2LTg4NGYtN2NhYzVkNmJhZTViIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiYjJpWnlXdnRka0w0NVByY1wvaDJvRkJqWjV5T3h0ZGF1RDZYZGJaSHh2UGp6NUVHaG9xWXpBM1NkOXRPbG9iWEwifQ==
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

TG9va3MgZ29vZCB0byBtZS4NClJldmlld2VkLWJ5OiBZYW4gWmhhbyA8eWFuLnkuemhhb0BpbnRl
bC5jb20+DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaW50ZWwtZ3Z0
LWRldiBbbWFpbHRvOmludGVsLWd2dC1kZXYtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmdd
IE9uDQo+IEJlaGFsZiBPZiBKYW5pIE5pa3VsYQ0KPiBTZW50OiBUdWVzZGF5LCBKYW51YXJ5IDgs
IDIwMTkgMTA6MTIgUE0NCj4gVG86IGludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
DQo+IENjOiBOaWt1bGEsIEphbmkgPGphbmkubmlrdWxhQGludGVsLmNvbT47IGludGVsLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmc7IFdhbmcsDQo+IFpoaSBBIDx6aGkuYS53YW5nQGludGVsLmNv
bT47IHpoZW55dXdAbGludXguaW50ZWwuY29tDQo+IFN1YmplY3Q6IFtQQVRDSCAyLzJdIGRybS9p
OTE1L2d2dDogZ2l2ZSB0aGUgY21kIHBhcnNlciBjbWRfaW5mbyBhIGNvbnN0DQo+IHRyZWF0bWVu
dA0KPiANCj4gSXQgZG9lc24ndCBuZWVkIHRvIGJlIGNoYW5nZWQsIG1ha2UgaXQgY29uc3QuIFRo
ZSBzdHJpbmcgbGl0ZXJhbHMgc2hvdWxkIGFueXdheQ0KPiBiZSByZWZlcnJlZCB0byBhcyBjb25z
dCBkYXRhLg0KPiANCj4gVGhlIGZvbGxvd2luZyBnZXRzIG1vdmVkIHRvIHJvZGF0YSBzZWN0aW9u
Og0KPiANCj4gMDAwMDAwMDAwMDAwMDA4MCBsICAgICBPIC5yb2RhdGEJMDAwMDAwMDAwMDAwMWMw
MCBjbWRfaW5mbw0KPiANCj4gU2lnbmVkLW9mZi1ieTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxh
QGludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvY21kX3BhcnNl
ci5jIHwgMjQgKysrKysrKysrKysrLS0tLS0tLS0tLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndnQvdHJhY2UuaCAgICAgIHwgIDIgKy0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0
aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3Z0L2NtZF9wYXJzZXIuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9j
bWRfcGFyc2VyLmMNCj4gaW5kZXggOTg0MTVkNDY1YTA5Li5jYWUwMGU2ZGViYWYgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9jbWRfcGFyc2VyLmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJzZXIuYw0KPiBAQCAtMzc1LDcgKzM3NSw3IEBA
IHR5cGVkZWYgaW50ICgqcGFyc2VyX2NtZF9oYW5kbGVyKShzdHJ1Y3QNCj4gcGFyc2VyX2V4ZWNf
c3RhdGUgKnMpOyAgI2RlZmluZSBBRERSX0ZJWF81KHgxLCB4MiwgeDMsIHg0LCB4NSkgIChBRERS
X0ZJWF8xKHgxKQ0KPiB8IEFERFJfRklYXzQoeDIsIHgzLCB4NCwgeDUpKQ0KPiANCj4gIHN0cnVj
dCBjbWRfaW5mbyB7DQo+IC0JY2hhciAqbmFtZTsNCj4gKwljb25zdCBjaGFyICpuYW1lOw0KPiAg
CXUzMiBvcGNvZGU7DQo+IA0KPiAgI2RlZmluZSBGX0xFTl9NQVNLCSgxVTw8MCkNCj4gQEAgLTQy
NSw3ICs0MjUsNyBAQCBzdHJ1Y3QgY21kX2luZm8gew0KPiANCj4gIHN0cnVjdCBjbWRfZW50cnkg
ew0KPiAgCXN0cnVjdCBobGlzdF9ub2RlIGhsaXN0Ow0KPiAtCXN0cnVjdCBjbWRfaW5mbyAqaW5m
bzsNCj4gKwljb25zdCBzdHJ1Y3QgY21kX2luZm8gKmluZm87DQo+ICB9Ow0KPiANCj4gIGVudW0g
ew0KPiBAQCAtNDc0LDcgKzQ3NCw3IEBAIHN0cnVjdCBwYXJzZXJfZXhlY19zdGF0ZSB7DQo+ICAJ
aW50IHNhdmVkX2J1Zl9hZGRyX3R5cGU7DQo+ICAJYm9vbCBpc19jdHhfd2E7DQo+IA0KPiAtCXN0
cnVjdCBjbWRfaW5mbyAqaW5mbzsNCj4gKwljb25zdCBzdHJ1Y3QgY21kX2luZm8gKmluZm87DQo+
IA0KPiAgCXN0cnVjdCBpbnRlbF92Z3B1X3dvcmtsb2FkICp3b3JrbG9hZDsNCj4gIH07DQo+IEBA
IC02MjUsNyArNjI1LDcgQEAgc3RhdGljIGlubGluZSB1MzIgZ2V0X29wY29kZSh1MzIgY21kLCBp
bnQgcmluZ19pZCkNCj4gIAlyZXR1cm4gY21kID4+ICgzMiAtIGRfaW5mby0+b3BfbGVuKTsNCj4g
IH0NCj4gDQo+IC1zdGF0aWMgaW5saW5lIHN0cnVjdCBjbWRfaW5mbyAqZmluZF9jbWRfZW50cnko
c3RydWN0IGludGVsX2d2dCAqZ3Z0LA0KPiArc3RhdGljIGlubGluZSBjb25zdCBzdHJ1Y3QgY21k
X2luZm8gKmZpbmRfY21kX2VudHJ5KHN0cnVjdCBpbnRlbF9ndnQNCj4gKypndnQsDQo+ICAJCXVu
c2lnbmVkIGludCBvcGNvZGUsIGludCByaW5nX2lkKQ0KPiAgew0KPiAgCXN0cnVjdCBjbWRfZW50
cnkgKmU7DQo+IEBAIC02MzgsNyArNjM4LDcgQEAgc3RhdGljIGlubGluZSBzdHJ1Y3QgY21kX2lu
Zm8gKmZpbmRfY21kX2VudHJ5KHN0cnVjdA0KPiBpbnRlbF9ndnQgKmd2dCwNCj4gIAlyZXR1cm4g
TlVMTDsNCj4gIH0NCj4gDQo+IC1zdGF0aWMgaW5saW5lIHN0cnVjdCBjbWRfaW5mbyAqZ2V0X2Nt
ZF9pbmZvKHN0cnVjdCBpbnRlbF9ndnQgKmd2dCwNCj4gK3N0YXRpYyBpbmxpbmUgY29uc3Qgc3Ry
dWN0IGNtZF9pbmZvICpnZXRfY21kX2luZm8oc3RydWN0IGludGVsX2d2dA0KPiArKmd2dCwNCj4g
IAkJdTMyIGNtZCwgaW50IHJpbmdfaWQpDQo+ICB7DQo+ICAJdTMyIG9wY29kZTsNCj4gQEAgLTc3
Niw3ICs3NzYsNyBAQCBzdGF0aWMgaW5saW5lIGludCBpcF9nbWFfYWR2YW5jZShzdHJ1Y3QNCj4g
cGFyc2VyX2V4ZWNfc3RhdGUgKnMsDQo+ICAJcmV0dXJuIDA7DQo+ICB9DQo+IA0KPiAtc3RhdGlj
IGlubGluZSBpbnQgZ2V0X2NtZF9sZW5ndGgoc3RydWN0IGNtZF9pbmZvICppbmZvLCB1MzIgY21k
KQ0KPiArc3RhdGljIGlubGluZSBpbnQgZ2V0X2NtZF9sZW5ndGgoY29uc3Qgc3RydWN0IGNtZF9p
bmZvICppbmZvLCB1MzIgY21kKQ0KPiAgew0KPiAgCWlmICgoaW5mby0+ZmxhZyAmIEZfTEVOX01B
U0spID09IEZfTEVOX0NPTlNUKQ0KPiAgCQlyZXR1cm4gaW5mby0+bGVuOw0KPiBAQCAtMTY0Myw3
ICsxNjQzLDcgQEAgc3RhdGljIGludCBiYXRjaF9idWZmZXJfbmVlZHNfc2NhbihzdHJ1Y3QNCj4g
cGFyc2VyX2V4ZWNfc3RhdGUgKnMpICBzdGF0aWMgaW50IGZpbmRfYmJfc2l6ZShzdHJ1Y3QgcGFy
c2VyX2V4ZWNfc3RhdGUgKnMsDQo+IHVuc2lnbmVkIGxvbmcgKmJiX3NpemUpICB7DQo+ICAJdW5z
aWduZWQgbG9uZyBnbWEgPSAwOw0KPiAtCXN0cnVjdCBjbWRfaW5mbyAqaW5mbzsNCj4gKwljb25z
dCBzdHJ1Y3QgY21kX2luZm8gKmluZm87DQo+ICAJdWludDMyX3QgY21kX2xlbiA9IDA7DQo+ICAJ
Ym9vbCBiYl9lbmQgPSBmYWxzZTsNCj4gIAlzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSA9IHMtPnZn
cHU7DQo+IEBAIC0xODQyLDcgKzE4NDIsNyBAQCBzdGF0aWMgaW50IGNtZF9oYW5kbGVyX21pX2Jh
dGNoX2J1ZmZlcl9zdGFydChzdHJ1Y3QNCj4gcGFyc2VyX2V4ZWNfc3RhdGUgKnMpDQo+IA0KPiAg
c3RhdGljIGludCBtaV9ub29wX2luZGV4Ow0KPiANCj4gLXN0YXRpYyBzdHJ1Y3QgY21kX2luZm8g
Y21kX2luZm9bXSA9IHsNCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgY21kX2luZm8gY21kX2luZm9b
XSA9IHsNCj4gIAl7Ik1JX05PT1AiLCBPUF9NSV9OT09QLCBGX0xFTl9DT05TVCwgUl9BTEwsIERf
QUxMLCAwLCAxLCBOVUxMfSwNCj4gDQo+ICAJeyJNSV9TRVRfUFJFRElDQVRFIiwgT1BfTUlfU0VU
X1BSRURJQ0FURSwgRl9MRU5fQ09OU1QsIFJfQUxMLA0KPiBEX0FMTCwgQEAgLTI1MjEsNyArMjUy
MSw3IEBAIHN0YXRpYyB2b2lkIGFkZF9jbWRfZW50cnkoc3RydWN0IGludGVsX2d2dA0KPiAqZ3Z0
LCBzdHJ1Y3QgY21kX2VudHJ5ICplKSAgc3RhdGljIGludCBjbWRfcGFyc2VyX2V4ZWMoc3RydWN0
IHBhcnNlcl9leGVjX3N0YXRlDQo+ICpzKSAgew0KPiAgCXN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1
ID0gcy0+dmdwdTsNCj4gLQlzdHJ1Y3QgY21kX2luZm8gKmluZm87DQo+ICsJY29uc3Qgc3RydWN0
IGNtZF9pbmZvICppbmZvOw0KPiAgCXUzMiBjbWQ7DQo+ICAJaW50IHJldCA9IDA7DQo+IA0KPiBA
QCAtMjg5NSwxMCArMjg5NSwxMCBAQCBpbnQgaW50ZWxfZ3Z0X3NjYW5fYW5kX3NoYWRvd193YV9j
dHgoc3RydWN0DQo+IGludGVsX3NoYWRvd193YV9jdHggKndhX2N0eCkNCj4gIAlyZXR1cm4gMDsN
Cj4gIH0NCj4gDQo+IC1zdGF0aWMgc3RydWN0IGNtZF9pbmZvICpmaW5kX2NtZF9lbnRyeV9hbnlf
cmluZyhzdHJ1Y3QgaW50ZWxfZ3Z0ICpndnQsDQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGNtZF9p
bmZvICpmaW5kX2NtZF9lbnRyeV9hbnlfcmluZyhzdHJ1Y3QgaW50ZWxfZ3Z0DQo+ICsqZ3Z0LA0K
PiAgCQl1bnNpZ25lZCBpbnQgb3Bjb2RlLCB1bnNpZ25lZCBsb25nIHJpbmdzKSAgew0KPiAtCXN0
cnVjdCBjbWRfaW5mbyAqaW5mbyA9IE5VTEw7DQo+ICsJY29uc3Qgc3RydWN0IGNtZF9pbmZvICpp
bmZvID0gTlVMTDsNCj4gIAl1bnNpZ25lZCBpbnQgcmluZzsNCj4gDQo+ICAJZm9yX2VhY2hfc2V0
X2JpdChyaW5nLCAmcmluZ3MsIEk5MTVfTlVNX0VOR0lORVMpIHsgQEAgLTI5MTMsNw0KPiArMjkx
Myw3IEBAIHN0YXRpYyBpbnQgaW5pdF9jbWRfdGFibGUoc3RydWN0IGludGVsX2d2dCAqZ3Z0KSAg
ew0KPiAgCWludCBpOw0KPiAgCXN0cnVjdCBjbWRfZW50cnkgKmU7DQo+IC0Jc3RydWN0IGNtZF9p
bmZvCSppbmZvOw0KPiArCWNvbnN0IHN0cnVjdCBjbWRfaW5mbyAqaW5mbzsNCj4gIAl1bnNpZ25l
ZCBpbnQgZ2VuX3R5cGU7DQo+IA0KPiAgCWdlbl90eXBlID0gaW50ZWxfZ3Z0X2dldF9kZXZpY2Vf
dHlwZShndnQpOyBkaWZmIC0tZ2l0DQo+IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3RyYWNl
LmggYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvdHJhY2UuaA0KPiBpbmRleCAxZmQ2NDIwMmQ3
NGUuLjZkNzg3NzUwZDI3OSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0
L3RyYWNlLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3RyYWNlLmgNCj4gQEAg
LTIyOCw3ICsyMjgsNyBAQCBUUkFDRV9FVkVOVChvb3Nfc3luYywgIFRSQUNFX0VWRU5UKGd2dF9j
b21tYW5kLA0KPiAgCVRQX1BST1RPKHU4IHZncHVfaWQsIHU4IHJpbmdfaWQsIHUzMiBpcF9nbWEs
IHUzMiAqY21kX3ZhLA0KPiAgCQl1MzIgY21kX2xlbiwgIHUzMiBidWZfdHlwZSwgdTMyIGJ1Zl9h
ZGRyX3R5cGUsDQo+IC0JCXZvaWQgKndvcmtsb2FkLCBjaGFyICpjbWRfbmFtZSksDQo+ICsJCXZv
aWQgKndvcmtsb2FkLCBjb25zdCBjaGFyICpjbWRfbmFtZSksDQo+IA0KPiAgCVRQX0FSR1Modmdw
dV9pZCwgcmluZ19pZCwgaXBfZ21hLCBjbWRfdmEsIGNtZF9sZW4sIGJ1Zl90eXBlLA0KPiAgCQli
dWZfYWRkcl90eXBlLCB3b3JrbG9hZCwgY21kX25hbWUpLA0KPiAtLQ0KPiAyLjIwLjENCj4gDQo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IGludGVs
LWd2dC1kZXYgbWFpbGluZyBsaXN0DQo+IGludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnDQo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50
ZWwtZ3Z0LWRldg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
bnRlbC1ndnQtZGV2Cg==
