Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp1304549ywd;
        Wed, 9 Jan 2019 18:51:31 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5Ac8TAh69rc0kwCoesbZn/yi5l2HRKb61jhwLEesScSBG42i8lFTMWg3o809gkIeRjPv1t
X-Received: by 2002:a62:2044:: with SMTP id g65mr8412162pfg.127.1547088691064;
        Wed, 09 Jan 2019 18:51:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547088691; cv=none;
        d=google.com; s=arc-20160816;
        b=LYYkG/ruqToz24zTuy6vA5dYQjQ2ax1L/pdamAQovJr7/t8g8YSre63iQ4DTQ7BHOY
         vI3Z0cg2nh170l3HGuMj90Y1zkPpjQDPr8feziTjASgJEFT/C9fR08ZH9Bc6rKeIvfpE
         t/3PMY06I+OMvsv3b9z/uvnOBp0zYs+a3Ce11rqd9sXcuqNofHbh2aKYOIpWn/FXRhXn
         hHHduKBQHr10Pgtc00DPolodsdb1NUKVfpWVJA1lEF2/K3jttz9qXfjd1UBfM/+ElF/v
         Dv5GoVEfIxFPK00Rrg4WWTulhAO0U9jckNB4W+YZfm8mFBsJwjpqdD4QU9K/VRFdJVge
         hNOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:dlp-reaction:dlp-version:dlp-product
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:to:from:delivered-to;
        bh=IeW1UvYlSoYE+eUe374q186ElRMe9uOeFpQ0DqPD57k=;
        b=x03YihIS/BGNi+L1z0gWRTGXMUUrYKTNlaBhOkTJ5jCV/We86DBrz8mvoLqzEK48rE
         B29wzz+hUCs7Vth9nNjv5+DZYTuIVrvKopghqZWHXVFa6As3fhEmKBQ/sTH95lghYkl+
         UlP3bzi8no+msqW5Hn7ZYmh95EQem6gD0llNxXsylKydn0oIIfkPtf45biv4VvQIMUlD
         Xy79VVzfSAOcmz75KeSdL1D4YDjv6Ca83oWD166UMEN34Xdr421KhESSCv/B0APD6sxd
         wPhOCTAy7gqgCGUWymyCpVMcZ6UoJKxljZRnlzT50JTff85IzuvEyhutBNEzNIdZIuYO
         5iEA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id b27si29882pgb.107.2019.01.09.18.51.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Jan 2019 18:51:31 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 508436E636;
	Thu, 10 Jan 2019 02:51:30 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 339886E632;
 Thu, 10 Jan 2019 02:51:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jan 2019 18:51:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,459,1539673200"; d="scan'208";a="290363276"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by orsmga005.jf.intel.com with ESMTP; 09 Jan 2019 18:51:28 -0800
Received: from fmsmsx119.amr.corp.intel.com (10.18.124.207) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 9 Jan 2019 18:51:28 -0800
Received: from shsmsx103.ccr.corp.intel.com (10.239.4.69) by
 FMSMSX119.amr.corp.intel.com (10.18.124.207) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 9 Jan 2019 18:51:27 -0800
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.63]) by
 SHSMSX103.ccr.corp.intel.com ([169.254.4.150]) with mapi id 14.03.0415.000;
 Thu, 10 Jan 2019 10:51:26 +0800
From: "Zhao, Yan Y" <yan.y.zhao@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Subject: RE: [PATCH 1/2] drm/i915/gvt: give the cmd parser decode_info a
 const treatment
Thread-Topic: [PATCH 1/2] drm/i915/gvt: give the cmd parser decode_info a
 const treatment
Thread-Index: AQHUp1v85E9K9k730EyaY759f0rBPKWnz9Og
Date: Thu, 10 Jan 2019 02:51:25 +0000
Message-ID: <F22B14EC3CFBB843AD3E03B6B78F2C6A4AD8144C@shsmsx102.ccr.corp.intel.com>
References: <20190108141205.17860-1-jani.nikula@intel.com>
In-Reply-To: <20190108141205.17860-1-jani.nikula@intel.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNzZkMjM3M2MtM2M2MC00Y2U4LThhOGYtOTc4Yjc3YzI5MzRhIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiWXVpUkZMTmlMbGhXUm5sR2N0c2dNT0Frbm9KTXM5TkRIbWcxaHFtTUtneDRtYTdnNFBiakppYk41QXZLbjBUSiJ9
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
bT47IHpoZW55dXdAbGludXguaW50ZWwuY29tDQo+IFN1YmplY3Q6IFtQQVRDSCAxLzJdIGRybS9p
OTE1L2d2dDogZ2l2ZSB0aGUgY21kIHBhcnNlciBkZWNvZGVfaW5mbyBhIGNvbnN0DQo+IHRyZWF0
bWVudA0KPiANCj4gSXQgZG9lc24ndCBuZWVkIHRvIGJlIGNoYW5nZWQsIG1ha2UgaXQgY29uc3Qu
IFRoZSBzdHJpbmcgbGl0ZXJhbHMgc2hvdWxkIGFueXdheQ0KPiBiZSByZWZlcnJlZCB0byBhcyBj
b25zdCBkYXRhLg0KPiANCj4gVGhlIGZvbGxvd2luZyBnZXRzIG1vdmVkIHRvIHJvZGF0YSBzZWN0
aW9uOg0KPiANCj4gMDAwMDAwMDAwMDAwMDQxMCBsICAgICBPIC5yb2RhdGEJMDAwMDAwMDAwMDAw
MDAxOCBkZWNvZGVfaW5mb19taQ0KPiAwMDAwMDAwMDAwMDAwMzkwIGwgICAgIE8gLnJvZGF0YQkw
MDAwMDAwMDAwMDAwMDE4DQo+IGRlY29kZV9pbmZvXzNkX21lZGlhDQo+IDAwMDAwMDAwMDAwMDAz
ZTAgbCAgICAgTyAucm9kYXRhCTAwMDAwMDAwMDAwMDAwMTggZGVjb2RlX2luZm9fMmQNCj4gMDAw
MDAwMDAwMDAwMDMzMCBsICAgICBPIC5yb2RhdGEJMDAwMDAwMDAwMDAwMDAxOA0KPiBkZWNvZGVf
aW5mb19tZnhfdmMNCj4gMDAwMDAwMDAwMDAwMDJlMCBsICAgICBPIC5yb2RhdGEJMDAwMDAwMDAw
MDAwMDAxOA0KPiBkZWNvZGVfaW5mb192ZWJveA0KPiAwMDAwMDAwMDAwMDAwMzAwIGwgICAgIE8g
LnJvZGF0YQkwMDAwMDAwMDAwMDAwMDI4IHN1Yl9vcF92ZWJveA0KPiAwMDAwMDAwMDAwMDAwMzYw
IGwgICAgIE8gLnJvZGF0YQkwMDAwMDAwMDAwMDAwMDI4IHN1Yl9vcF9tZnhfdmMNCj4gMDAwMDAw
MDAwMDAwMDNjMCBsICAgICBPIC5yb2RhdGEJMDAwMDAwMDAwMDAwMDAyMCBzdWJfb3BfM2RfbWVk
aWENCj4gMDAwMDAwMDAwMDAwMDQwMCBsICAgICBPIC5yb2RhdGEJMDAwMDAwMDAwMDAwMDAxMCBz
dWJfb3BfMmQNCj4gMDAwMDAwMDAwMDAwMDQzMCBsICAgICBPIC5yb2RhdGEJMDAwMDAwMDAwMDAw
MDAxMCBzdWJfb3BfbWkNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5p
a3VsYUBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9w
YXJzZXIuYyB8IDMwICsrKysrKysrKysrKystLS0tLS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDE1IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9jbWRfcGFyc2VyLmMNCj4gYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndnQvY21kX3BhcnNlci5jDQo+IGluZGV4IDc3YWU2MzRlYjExYy4uOTg0MTVkNDY1
YTA5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvY21kX3BhcnNlci5j
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9jbWRfcGFyc2VyLmMNCj4gQEAgLTU1
LDEwICs1NSwxMCBAQCBzdHJ1Y3Qgc3ViX29wX2JpdHMgew0KPiAgCWludCBsb3c7DQo+ICB9Ow0K
PiAgc3RydWN0IGRlY29kZV9pbmZvIHsNCj4gLQljaGFyICpuYW1lOw0KPiArCWNvbnN0IGNoYXIg
Km5hbWU7DQo+ICAJaW50IG9wX2xlbjsNCj4gIAlpbnQgbnJfc3ViX29wOw0KPiAtCXN0cnVjdCBz
dWJfb3BfYml0cyAqc3ViX29wOw0KPiArCWNvbnN0IHN0cnVjdCBzdWJfb3BfYml0cyAqc3ViX29w
Ow0KPiAgfTsNCj4gDQo+ICAjZGVmaW5lICAgTUFYX0NNRF9CVURHRVQJCQkweDdmZmZmZmZmDQo+
IEBAIC00ODUsMTIgKzQ4NSwxMiBAQCBzdHJ1Y3QgcGFyc2VyX2V4ZWNfc3RhdGUgeyAgc3RhdGlj
IHVuc2lnbmVkIGxvbmcNCj4gYnlwYXNzX3NjYW5fbWFzayA9IDA7DQo+IA0KPiAgLyogcmluZyBB
TEwsIHR5cGUgPSAwICovDQo+IC1zdGF0aWMgc3RydWN0IHN1Yl9vcF9iaXRzIHN1Yl9vcF9taVtd
ID0gew0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBzdWJfb3BfYml0cyBzdWJfb3BfbWlbXSA9IHsN
Cj4gIAl7MzEsIDI5fSwNCj4gIAl7MjgsIDIzfSwNCj4gIH07DQo+IA0KPiAtc3RhdGljIHN0cnVj
dCBkZWNvZGVfaW5mbyBkZWNvZGVfaW5mb19taSA9IHsNCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qg
ZGVjb2RlX2luZm8gZGVjb2RlX2luZm9fbWkgPSB7DQo+ICAJIk1JIiwNCj4gIAlPUF9MRU5fTUks
DQo+ICAJQVJSQVlfU0laRShzdWJfb3BfbWkpLA0KPiBAQCAtNDk4LDEyICs0OTgsMTIgQEAgc3Rh
dGljIHN0cnVjdCBkZWNvZGVfaW5mbyBkZWNvZGVfaW5mb19taSA9IHsgIH07DQo+IA0KPiAgLyog
cmluZyBSQ1MsIGNvbW1hbmQgdHlwZSAyICovDQo+IC1zdGF0aWMgc3RydWN0IHN1Yl9vcF9iaXRz
IHN1Yl9vcF8yZFtdID0gew0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBzdWJfb3BfYml0cyBzdWJf
b3BfMmRbXSA9IHsNCj4gIAl7MzEsIDI5fSwNCj4gIAl7MjgsIDIyfSwNCj4gIH07DQo+IA0KPiAt
c3RhdGljIHN0cnVjdCBkZWNvZGVfaW5mbyBkZWNvZGVfaW5mb18yZCA9IHsNCj4gK3N0YXRpYyBj
b25zdCBzdHJ1Y3QgZGVjb2RlX2luZm8gZGVjb2RlX2luZm9fMmQgPSB7DQo+ICAJIjJEIiwNCj4g
IAlPUF9MRU5fMkQsDQo+ICAJQVJSQVlfU0laRShzdWJfb3BfMmQpLA0KPiBAQCAtNTExLDE0ICs1
MTEsMTQgQEAgc3RhdGljIHN0cnVjdCBkZWNvZGVfaW5mbyBkZWNvZGVfaW5mb18yZCA9IHsgIH07
DQo+IA0KPiAgLyogcmluZyBSQ1MsIGNvbW1hbmQgdHlwZSAzICovDQo+IC1zdGF0aWMgc3RydWN0
IHN1Yl9vcF9iaXRzIHN1Yl9vcF8zZF9tZWRpYVtdID0gew0KPiArc3RhdGljIGNvbnN0IHN0cnVj
dCBzdWJfb3BfYml0cyBzdWJfb3BfM2RfbWVkaWFbXSA9IHsNCj4gIAl7MzEsIDI5fSwNCj4gIAl7
MjgsIDI3fSwNCj4gIAl7MjYsIDI0fSwNCj4gIAl7MjMsIDE2fSwNCj4gIH07DQo+IA0KPiAtc3Rh
dGljIHN0cnVjdCBkZWNvZGVfaW5mbyBkZWNvZGVfaW5mb18zZF9tZWRpYSA9IHsNCj4gK3N0YXRp
YyBjb25zdCBzdHJ1Y3QgZGVjb2RlX2luZm8gZGVjb2RlX2luZm9fM2RfbWVkaWEgPSB7DQo+ICAJ
IjNEX01lZGlhIiwNCj4gIAlPUF9MRU5fM0RfTUVESUEsDQo+ICAJQVJSQVlfU0laRShzdWJfb3Bf
M2RfbWVkaWEpLA0KPiBAQCAtNTI2LDcgKzUyNiw3IEBAIHN0YXRpYyBzdHJ1Y3QgZGVjb2RlX2lu
Zm8gZGVjb2RlX2luZm9fM2RfbWVkaWEgPSB7ICB9Ow0KPiANCj4gIC8qIHJpbmcgVkNTLCBjb21t
YW5kIHR5cGUgMyAqLw0KPiAtc3RhdGljIHN0cnVjdCBzdWJfb3BfYml0cyBzdWJfb3BfbWZ4X3Zj
W10gPSB7DQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHN1Yl9vcF9iaXRzIHN1Yl9vcF9tZnhfdmNb
XSA9IHsNCj4gIAl7MzEsIDI5fSwNCj4gIAl7MjgsIDI3fSwNCj4gIAl7MjYsIDI0fSwNCj4gQEAg
LTUzNCw3ICs1MzQsNyBAQCBzdGF0aWMgc3RydWN0IHN1Yl9vcF9iaXRzIHN1Yl9vcF9tZnhfdmNb
XSA9IHsNCj4gIAl7MjAsIDE2fSwNCj4gIH07DQo+IA0KPiAtc3RhdGljIHN0cnVjdCBkZWNvZGVf
aW5mbyBkZWNvZGVfaW5mb19tZnhfdmMgPSB7DQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGRlY29k
ZV9pbmZvIGRlY29kZV9pbmZvX21meF92YyA9IHsNCj4gIAkiTUZYX1ZDIiwNCj4gIAlPUF9MRU5f
TUZYX1ZDLA0KPiAgCUFSUkFZX1NJWkUoc3ViX29wX21meF92YyksDQo+IEBAIC01NDIsNyArNTQy
LDcgQEAgc3RhdGljIHN0cnVjdCBkZWNvZGVfaW5mbyBkZWNvZGVfaW5mb19tZnhfdmMgPSB7ICB9
Ow0KPiANCj4gIC8qIHJpbmcgVkVDUywgY29tbWFuZCB0eXBlIDMgKi8NCj4gLXN0YXRpYyBzdHJ1
Y3Qgc3ViX29wX2JpdHMgc3ViX29wX3ZlYm94W10gPSB7DQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0
IHN1Yl9vcF9iaXRzIHN1Yl9vcF92ZWJveFtdID0gew0KPiAgCXszMSwgMjl9LA0KPiAgCXsyOCwg
Mjd9LA0KPiAgCXsyNiwgMjR9LA0KPiBAQCAtNTUwLDE0ICs1NTAsMTQgQEAgc3RhdGljIHN0cnVj
dCBzdWJfb3BfYml0cyBzdWJfb3BfdmVib3hbXSA9IHsNCj4gIAl7MjAsIDE2fSwNCj4gIH07DQo+
IA0KPiAtc3RhdGljIHN0cnVjdCBkZWNvZGVfaW5mbyBkZWNvZGVfaW5mb192ZWJveCA9IHsNCj4g
K3N0YXRpYyBjb25zdCBzdHJ1Y3QgZGVjb2RlX2luZm8gZGVjb2RlX2luZm9fdmVib3ggPSB7DQo+
ICAJIlZFQk9YIiwNCj4gIAlPUF9MRU5fVkVCT1gsDQo+ICAJQVJSQVlfU0laRShzdWJfb3BfdmVi
b3gpLA0KPiAgCXN1Yl9vcF92ZWJveCwNCj4gIH07DQo+IA0KPiAtc3RhdGljIHN0cnVjdCBkZWNv
ZGVfaW5mbyAqcmluZ19kZWNvZGVfaW5mb1tJOTE1X05VTV9FTkdJTkVTXVs4XSA9IHsNCj4gK3N0
YXRpYyBjb25zdCBzdHJ1Y3QgZGVjb2RlX2luZm8gKnJpbmdfZGVjb2RlX2luZm9bSTkxNV9OVU1f
RU5HSU5FU11bOF0NCj4gKz0gew0KPiAgCVtSQ1NdID0gew0KPiAgCQkmZGVjb2RlX2luZm9fbWks
DQo+ICAJCU5VTEwsDQo+IEBAIC02MTYsNyArNjE2LDcgQEAgc3RhdGljIHN0cnVjdCBkZWNvZGVf
aW5mbw0KPiAqcmluZ19kZWNvZGVfaW5mb1tJOTE1X05VTV9FTkdJTkVTXVs4XSA9IHsNCj4gDQo+
ICBzdGF0aWMgaW5saW5lIHUzMiBnZXRfb3Bjb2RlKHUzMiBjbWQsIGludCByaW5nX2lkKSAgew0K
PiAtCXN0cnVjdCBkZWNvZGVfaW5mbyAqZF9pbmZvOw0KPiArCWNvbnN0IHN0cnVjdCBkZWNvZGVf
aW5mbyAqZF9pbmZvOw0KPiANCj4gIAlkX2luZm8gPSByaW5nX2RlY29kZV9pbmZvW3JpbmdfaWRd
W0NNRF9UWVBFKGNtZCldOw0KPiAgCWlmIChkX2luZm8gPT0gTlVMTCkNCj4gQEAgLTY1Nyw3ICs2
NTcsNyBAQCBzdGF0aWMgaW5saW5lIHUzMiBzdWJfb3BfdmFsKHUzMiBjbWQsIHUzMiBoaSwgdTMy
IGxvdykNCj4gDQo+ICBzdGF0aWMgaW5saW5lIHZvaWQgcHJpbnRfb3Bjb2RlKHUzMiBjbWQsIGlu
dCByaW5nX2lkKSAgew0KPiAtCXN0cnVjdCBkZWNvZGVfaW5mbyAqZF9pbmZvOw0KPiArCWNvbnN0
IHN0cnVjdCBkZWNvZGVfaW5mbyAqZF9pbmZvOw0KPiAgCWludCBpOw0KPiANCj4gIAlkX2luZm8g
PSByaW5nX2RlY29kZV9pbmZvW3JpbmdfaWRdW0NNRF9UWVBFKGNtZCldOw0KPiAtLQ0KPiAyLjIw
LjENCj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
DQo+IGludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0DQo+IGludGVsLWd2dC1kZXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnDQo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaW50ZWwtZ3Z0LWRldg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9pbnRlbC1ndnQtZGV2Cg==
