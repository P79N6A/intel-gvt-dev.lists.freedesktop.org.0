Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5a0b:0:0:0:0:0 with SMTP id o11csp1194267ywb;
        Mon, 11 Mar 2019 02:17:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyOcciike3Tv5XIXd7XBJB6LJzfubmeLGc0rfB156UqPWIKvoCq3LJ7V9o5IFHh6qTG0DRk
X-Received: by 2002:a63:6b03:: with SMTP id g3mr11945133pgc.239.1552295878307;
        Mon, 11 Mar 2019 02:17:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552295878; cv=none;
        d=google.com; s=arc-20160816;
        b=gPR8mUsolFy1PyKMgsoVNoNrGTAZHxN467tiSMTMJW/vTBzMKKIARoes8mQrw28KCm
         ucQxbiw5Jio/g12TzRdb0jRp0j4bKWwz6w6qZPPJ2xsFKkG2gsa3F/CcPR7ssCJVuWpZ
         +Nz9SA6JLPbPrqDOXZ3/1guPrmb/imZuIefqDSRJOUmffRqfm9Dc4H+CShSNB5UbjFqe
         Vkw/Q2aKENyhngFv9iosdKg7EVQvEIHNSrkKhgRCFcA3YPRpm+d2uEZ8lykTNOVF5imo
         KojjeSWfFV/kYxAsNA10LxlNKGL8Bh8AA/mFlKLfRtzo9AM+v7tHqFSwDIhNfXsYZLMz
         +BdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:dlp-reaction:dlp-version:dlp-product
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:to:from:delivered-to;
        bh=UYtbdsmTW1SxlrqMY9/6wCphC4EuxpzqH4tRyGGIDY0=;
        b=vrYBdDOUKajnkmn7s55i3FeDFQESU730WeUo/gb+o+M576SvtthPV0ySAcn585/vVw
         dHauGIf14B7CZi5MYyR5I8WQboqIBs+IBGGmr4x6a2of90V1L0i+fUmOZ/NvQwayAtCm
         D7TrR/LJmC8t8lZux9Es2HRoGjrqnoIYr4x5evnXzgfbwLFg+e7k1X27zHpKrwC+p8T4
         BTSfYkZztFEaAghEuTjAr2n7nZrR/oBpM8kNWnLx7mWRiEU+K0S1xmdr84nIDV1ZpFBU
         eNT0KdDgHaEKGq0atWeid4FS+tTAVa8URBibTiQcDzzqRASW5WNlQamMlu55agA+CrJW
         GCJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id k3si4920188pfb.100.2019.03.11.02.17.57
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Mar 2019 02:17:58 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B63C899A7;
	Mon, 11 Mar 2019 09:17:57 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1455F899A7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 11 Mar 2019 09:17:55 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Mar 2019 02:17:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,467,1544515200"; d="scan'208";a="151180273"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by fmsmga004.fm.intel.com with ESMTP; 11 Mar 2019 02:17:55 -0700
Received: from fmsmsx120.amr.corp.intel.com (10.18.124.208) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 11 Mar 2019 02:17:55 -0700
Received: from shsmsx103.ccr.corp.intel.com (10.239.4.69) by
 fmsmsx120.amr.corp.intel.com (10.18.124.208) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 11 Mar 2019 02:17:54 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.74]) by
 SHSMSX103.ccr.corp.intel.com ([169.254.4.134]) with mapi id 14.03.0415.000;
 Mon, 11 Mar 2019 17:17:52 +0800
From: "Yuan, Hang" <hang.yuan@intel.com>
To: "Zhao, Yan Y" <yan.y.zhao@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Subject: RE: [PATCH v6 2/2] drm/i915/gvt: call common mmio rw routine for
 vreg update in lri cmd parser
Thread-Topic: [PATCH v6 2/2] drm/i915/gvt: call common mmio rw routine for
 vreg update in lri cmd parser
Thread-Index: AQHU18bxm9/6QKDHIUKWzpFP9uMiaaYGJh2A
Date: Mon, 11 Mar 2019 09:17:52 +0000
Message-ID: <C294FBAE55175941838A8D362DCD8AA225EBCF15@SHSMSX104.ccr.corp.intel.com>
References: <20190311014214.14057-1-yan.y.zhao@intel.com>
 <20190311045200.20014-1-yan.y.zhao@intel.com>
In-Reply-To: <20190311045200.20014-1-yan.y.zhao@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOTIzY2M3NGYtOWM5Ni00MTFkLWE4NWEtNDZiMjQ5ODk4NGNhIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoibytcLzYxYUNjbUFGSGN6WkdnY3RHcFB0Zk9HWlJQdkplK0JxNGROSlVSaWVmSWhobjBVSUdKRkU0TGczNVwvOWNEIn0=
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

SnVzdCBoYXZlIGNvbmNlcm4gdGhhdCBpbnRlbF92Z3B1X21taW9fcmVnX3J3KClkb2VzIGVtdWxh
dGUgcmVnaXN0ZXIncyBiZWhhdmlvciBhcyB3ZWxsIGJ1dCBjbWRfcmVnX2hhbmRsZXIoKSBqdXN0
IHNhdmVzIHJlZ2lzdGVyJ3MgdmFsdWUgaW4gdnJlZy4NCg0KUmVnYXJkcywNCkhlbnJ5DQoNCj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaW50ZWwtZ3Z0LWRldiBbbWFpbHRv
OmludGVsLWd2dC1kZXYtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmddIE9uDQo+IEJlaGFs
ZiBPZiBZYW4gWmhhbw0KPiBTZW50OiBNb25kYXksIE1hcmNoIDExLCAyMDE5IDEyOjUyIFBNDQo+
IFRvOiBpbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogWmhhbywgWWFu
IFkgPHlhbi55LnpoYW9AaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggdjYgMi8yXSBkcm0v
aTkxNS9ndnQ6IGNhbGwgY29tbW9uIG1taW8gcncgcm91dGluZSBmb3IgdnJlZw0KPiB1cGRhdGUg
aW4gbHJpIGNtZCBwYXJzZXINCj4gDQo+IGluIGNtZCBwYXJzZXIsIHdoZW4gdGhlcmUncyBhIG5l
ZWQgdG8gdXBkYXRlIHZyZWdzIGFjY29yZGluZyB0byBjb21tYW5kcw0KPiBiZWluZyBwYXJzZWQs
IGRvIG5vdCBjcmVhdGUgYSBzZXBhcmF0ZSBmdW5jdGlvbg0KPiBpbnRlbF92Z3B1X21hc2tfbW1p
b193cml0ZSgpLCBidXQgY2FsbCBpbnRlbF92Z3B1X21taW9fcmVnX3J3KCkgdG8ga2VlcA0KPiBj
b25zaXN0ZW50IHdpdGggaGFuZGxpbmcgYmVoYXZpb3IgZm9yIENQVSByZWFkL3dyaXRlIG9mIG1t
aW8uDQo+IA0KPiBUaGlzIHBhdGNoIGlzIGEgY29kZSByZWZpbmVtZW50IHRvDQo+IGNvbW1pdCA2
Y2VmMjFhMTk2NDkgKCJkcm0vaTkxNS9ndnQ6IHVwZGF0ZSB2cmVnIG9uIGluaGliaXQgY29udGV4
dCBscmkNCj4gY29tbWFuZCIpDQo+IA0KPiB2NjogdXBkYXRlIGNvbW1pdCBtZXNzYWdlICh6aGVu
eXUgd2FuZykNCj4gdjU6IHJlbW92ZSBpbnRlbF92Z3B1X21hc2tfbW1pb193cml0ZSBpbiBtbWlv
LmgNCj4gdjQ6IGNoZWNrIHJldHVybiB2YWx1ZSBvZiBpbnRlbF92Z3B1X21taW9fcmVnX3J3KCkN
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IFlhbiBaaGFvIDx5YW4ueS56aGFvQGludGVsLmNvbT4NCj4g
LS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvY21kX3BhcnNlci5jIHwgMTEgKysrKyst
LS0tLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9oYW5kbGVycy5jICAgfCAyNCAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9tbWlvLmgg
ICAgICAgfCAgMiAtLQ0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDMyIGRl
bGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9j
bWRfcGFyc2VyLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvY21kX3BhcnNlci5jDQo+
IGluZGV4IDM1OTJkMDRjMzNiMi4uMjZhNmJmYzcwNjVjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndnQvY21kX3BhcnNlci5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2d2dC9jbWRfcGFyc2VyLmMNCj4gQEAgLTkwOSwxMyArOTA5LDEyIEBAIHN0YXRpYyBpbnQg
Y21kX3JlZ19oYW5kbGVyKHN0cnVjdA0KPiBwYXJzZXJfZXhlY19zdGF0ZSAqcywNCj4gIAkJCXMt
Pndvcmtsb2FkLT5yaW5nX2NvbnRleHRfZ3BhICsgMTIsICZjdHhfc3JfY3RsLCA0KTsNCj4gIAkJ
LyogY2hlY2sgaW5oaWJpdCBjb250ZXh0ICovDQo+ICAJCWlmIChjdHhfc3JfY3RsICYgMSkgew0K
PiArCQkJaW50IHJldCA9IDA7DQo+ICAJCQl1MzIgZGF0YSA9IGNtZF92YWwocywgaW5kZXggKyAx
KTsNCj4gLQ0KPiAtCQkJaWYgKGludGVsX2d2dF9tbWlvX2hhc19tb2RlX21hc2socy0+dmdwdS0+
Z3Z0LA0KPiBvZmZzZXQpKQ0KPiAtCQkJCWludGVsX3ZncHVfbWFza19tbWlvX3dyaXRlKHZncHUs
DQo+IC0JCQkJCQkJb2Zmc2V0LCAmZGF0YSwgNCk7DQo+IC0JCQllbHNlDQo+IC0JCQkJdmdwdV92
cmVnKHZncHUsIG9mZnNldCkgPSBkYXRhOw0KPiArCQkJcmV0ID0gaW50ZWxfdmdwdV9tbWlvX3Jl
Z19ydyhzLT52Z3B1LCBvZmZzZXQsDQo+ICsJCQkJCSZkYXRhLCA0LCBmYWxzZSk7DQo+ICsJCQlp
ZiAocmV0KQ0KPiArCQkJCXJldHVybiByZXQ7DQo+ICAJCX0NCj4gIAl9DQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMNCj4gYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYw0KPiBpbmRleCA1NGJkMGIwMzMyOTguLjU0NTE1NGFm
OTNlOSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMNCj4gQEAgLTM0MDEs
MzAgKzM0MDEsNiBAQCBpbnQgaW50ZWxfdmdwdV9kZWZhdWx0X21taW9fd3JpdGUoc3RydWN0DQo+
IGludGVsX3ZncHUgKnZncHUsIHVuc2lnbmVkIGludCBvZmZzZXQsDQo+ICAJcmV0dXJuIDA7DQo+
ICB9DQo+IA0KPiAtLyoqDQo+IC0gKiBpbnRlbF92Z3B1X21hc2tfbW1pb193cml0ZSAtIHdyaXRl
IG1hc2sgcmVnaXN0ZXINCj4gLSAqIEB2Z3B1OiBhIHZHUFUNCj4gLSAqIEBvZmZzZXQ6IGFjY2Vz
cyBvZmZzZXQNCj4gLSAqIEBwX2RhdGE6IHdyaXRlIGRhdGEgYnVmZmVyDQo+IC0gKiBAYnl0ZXM6
IGFjY2VzcyBkYXRhIGxlbmd0aA0KPiAtICoNCj4gLSAqIFJldHVybnM6DQo+IC0gKiBaZXJvIG9u
IHN1Y2Nlc3MsIG5lZ2F0aXZlIGVycm9yIGNvZGUgaWYgZmFpbGVkLg0KPiAtICovDQo+IC1pbnQg
aW50ZWxfdmdwdV9tYXNrX21taW9fd3JpdGUoc3RydWN0IGludGVsX3ZncHUgKnZncHUsIHVuc2ln
bmVkIGludA0KPiBvZmZzZXQsDQo+IC0JCXZvaWQgKnBfZGF0YSwgdW5zaWduZWQgaW50IGJ5dGVz
KQ0KPiAtew0KPiAtCXUzMiBtYXNrLCBvbGRfdnJlZzsNCj4gLQ0KPiAtCW9sZF92cmVnID0gdmdw
dV92cmVnKHZncHUsIG9mZnNldCk7DQo+IC0Jd3JpdGVfdnJlZyh2Z3B1LCBvZmZzZXQsIHBfZGF0
YSwgYnl0ZXMpOw0KPiAtCW1hc2sgPSB2Z3B1X3ZyZWcodmdwdSwgb2Zmc2V0KSA+PiAxNjsNCj4g
LQl2Z3B1X3ZyZWcodmdwdSwgb2Zmc2V0KSA9IChvbGRfdnJlZyAmIH5tYXNrKSB8DQo+IC0JCQkJ
KHZncHVfdnJlZyh2Z3B1LCBvZmZzZXQpICYgbWFzayk7DQo+IC0NCj4gLQlyZXR1cm4gMDsNCj4g
LX0NCj4gLQ0KPiAgLyoqDQo+ICAgKiBpbnRlbF9ndnRfaW5fZm9yY2Vfbm9ucHJpdl93aGl0ZWxp
c3QgLSBpZiBhIG1taW8gaXMgaW4gd2hpdGVsaXN0IHRvIGJlDQo+ICAgKiBmb3JjZS1ub3ByaXYg
cmVnaXN0ZXINCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9tbWlvLmgN
Cj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvbW1pby5oIGluZGV4IDU4NzRmMWNiNDMwNi4u
MmE4YWU4ODk4MjY1DQo+IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
bW1pby5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9tbWlvLmgNCj4gQEAgLTEw
MCw2ICsxMDAsNCBAQCBib29sIGludGVsX2d2dF9pbl9mb3JjZV9ub25wcml2X3doaXRlbGlzdChz
dHJ1Y3QNCj4gaW50ZWxfZ3Z0ICpndnQsICBpbnQgaW50ZWxfdmdwdV9tbWlvX3JlZ19ydyhzdHJ1
Y3QgaW50ZWxfdmdwdSAqdmdwdSwNCj4gdW5zaWduZWQgaW50IG9mZnNldCwNCj4gIAkJCSAgIHZv
aWQgKnBkYXRhLCB1bnNpZ25lZCBpbnQgYnl0ZXMsIGJvb2wgaXNfcmVhZCk7DQo+IA0KPiAtaW50
IGludGVsX3ZncHVfbWFza19tbWlvX3dyaXRlKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LCB1bnNp
Z25lZCBpbnQNCj4gb2Zmc2V0LA0KPiAtCQkJCSAgdm9pZCAqcF9kYXRhLCB1bnNpZ25lZCBpbnQg
Ynl0ZXMpOw0KPiAgI2VuZGlmDQo+IC0tDQo+IDIuMTcuMQ0KPiANCj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gaW50ZWwtZ3Z0LWRldiBtYWlsaW5n
IGxpc3QNCj4gaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2DQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2
IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
