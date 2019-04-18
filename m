Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp66010ywo;
        Wed, 17 Apr 2019 18:30:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqznFVDBO/hz8nD3CxvSAE1016w5y1JFQeZuNJJqMA5GpvoEPUbUt6EaNuE0KVHdnshSt3eB
X-Received: by 2002:a62:1215:: with SMTP id a21mr92221496pfj.126.1555551053744;
        Wed, 17 Apr 2019 18:30:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555551053; cv=none;
        d=google.com; s=arc-20160816;
        b=pElqgLE/t7JBviWWR/C6psE064LHrhpGvBW2sdjFjZlXHuH9YUaj4nAreTOHVTcQLi
         OSNxqJKUY8dvq3savcneczzL8re7LU/qMsaavvjurOKaz6WkmPjOjV/sVQ4Zv+r0RLdh
         m2neQH6r+ZhzdkNbVPvU4dJc6/zvLRwrZi1DuyVaIQVBdPBN3VbmR8du9TMgZqSPcx3C
         CoLdLVKx20PL3h/jl2WFBxm5Mzj7rcgZ5sp5lw6qALUJScEij11AizYspnJ6ggAi06GE
         OOf+EUoASo+RCE/VPfP13rxTdMM2/QjR80H+yDLWQUEI+ii5CUv3XSGeBLd7g4g2PX1W
         2hXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence
         :mime-version:dlp-reaction:dlp-version:dlp-product:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:delivered-to;
        bh=huOeAeKsjQjJ4YSbYJcwgADn7Hb48W/pmXbtokTALUU=;
        b=A9rJX++pN1czn5TMlTHYd7nBOnkxKruCZnV51HbYgDKb7AyqtEKuhNDcp2GNVTedw6
         hbX1bGkaNUYgHcVbZLNiNSp1kyGVXanyHafrR7z10usJAZyy4UCwZM+JAItAJG7ZoksS
         J6WLA9FKpq5Ffl4EmWhq+MhBW74i8CUfZ3I4xlD+Iz2Qe9ajUnX4tcxTlq9rlK1BWOF3
         lKqroWwWxkAAdC7Kb53uJmEKafyE1Erw1XoznlzgkFJNDxJ6GpT5XyRU79EPZq0L/P/y
         CMIPOvG7u51VKCcO8YIutvSnrlr8Jx8dQ6olp8yrK+2TMmOTyBODKcUAETuIv5l2xL+j
         NaGg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id 30si608921plb.235.2019.04.17.18.30.53
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Apr 2019 18:30:53 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B0AD6E0B3;
	Thu, 18 Apr 2019 01:30:53 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9B56E0B3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 18 Apr 2019 01:30:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Apr 2019 18:30:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,364,1549958400"; d="scan'208";a="143644792"
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
 by orsmga003.jf.intel.com with ESMTP; 17 Apr 2019 18:30:51 -0700
Received: from fmsmsx161.amr.corp.intel.com (10.18.125.9) by
 fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 17 Apr 2019 18:30:50 -0700
Received: from shsmsx107.ccr.corp.intel.com (10.239.4.96) by
 FMSMSX161.amr.corp.intel.com (10.18.125.9) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 17 Apr 2019 18:30:50 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.92]) by
 SHSMSX107.ccr.corp.intel.com ([169.254.9.153]) with mapi id 14.03.0415.000;
 Thu, 18 Apr 2019 09:30:48 +0800
From: "Yuan, Hang" <hang.yuan@intel.com>
To: "He, Min" <min.he@intel.com>, "hang.yuan@linux.intel.com"
 <hang.yuan@linux.intel.com>, "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915/gvt: remove call trace in plane scaling handler
Thread-Topic: [PATCH] drm/i915/gvt: remove call trace in plane scaling handler
Thread-Index: AQHU9QtE3Lb4SWvnjkithxf4VWPg9KZAm9+AgACGiZA=
Date: Thu, 18 Apr 2019 01:30:47 +0000
Message-ID: <C294FBAE55175941838A8D362DCD8AA225ED4C3E@SHSMSX104.ccr.corp.intel.com>
References: <1555497634-8596-1-git-send-email-hang.yuan@linux.intel.com>
 <B8F3B07A09E6B84F88EAD83F055E9945519F6099@SHSMSX103.ccr.corp.intel.com>
In-Reply-To: <B8F3B07A09E6B84F88EAD83F055E9945519F6099@SHSMSX103.ccr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZDY3YjIzYTgtMWJiYy00YzdjLWFhMDAtNTM3ZDE5MDRmZDI0IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiNFBCU2tWc0EyekMwelp5dndJRXkxUGkxSHAyNzgwUFwvb1hZMlZIZEJXWEhWZTRwaHdydmt1RkRXQ3lrYWxrc2UifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
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

R290IGl0LiBUaGFuayB5b3UgZm9yIHRoZSBleHBsYWluaW5nIQ0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IGludGVsLWd2dC1kZXYgW21haWx0bzppbnRlbC1ndnQtZGV2
LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnXSBPbg0KPiBCZWhhbGYgT2YgSGUsIE1pbg0K
PiBTZW50OiBUaHVyc2RheSwgQXByaWwgMTgsIDIwMTkgOToyOSBBTQ0KPiBUbzogaGFuZy55dWFu
QGxpbnV4LmludGVsLmNvbTsgaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4g
U3ViamVjdDogUkU6IFtQQVRDSF0gZHJtL2k5MTUvZ3Z0OiByZW1vdmUgY2FsbCB0cmFjZSBpbiBw
bGFuZSBzY2FsaW5nIGhhbmRsZXINCj4gDQo+IEhlbnJ5LA0KPiBXaGVuIGd1ZXN0IGlzIHRyeWlu
ZyB0byB1c2UgdGhlIHBsYW5lIHNjYWxlciwgaXQgd2lsbCB3cml0ZSB0byB0aGUgUFNfQ1RSTA0K
PiByZWdpc3RlciBvbiBldmVyeSBwbGFuZSB1cGRhdGUuIEFuZCB3ZSBkb27igJl0IGhhdmUgbWVj
aGFuaXNtcyB0byBub3RpZnkgdGhlDQo+IGd1ZXN0IHRoYXQgc2NhbGVyIGlzIG5vdCBhdmFpbGFi
bGUuIFNvIGlmIHlvdSBtb2RpZnkgaXQgdG8gZ3Z0X3ZncHVfZXJyKCksIGl0IHdpbGwNCj4gY2F1
c2UgbWFzc2l2ZSBkbWVzZyBsb2dzIGluIGRvbTAsIHdoYXQncyB3aHkgd2UgdXNlZCBXQVJOX09O
X09OQ0UoKQ0KPiB0byBsb2cgaXQuDQo+IA0KPiBUaGFua3MuDQo+IA0KPiA+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogaW50ZWwtZ3Z0LWRldg0KPiA+IFttYWlsdG86aW50
ZWwtZ3Z0LWRldi1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZ10gT24gQmVoYWxmIE9mDQo+
ID4gaGFuZy55dWFuQGxpbnV4LmludGVsLmNvbQ0KPiA+IFNlbnQ6IFdlZG5lc2RheSwgQXByaWwg
MTcsIDIwMTkgNjo0MSBQTQ0KPiA+IFRvOiBpbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZw0KPiA+IENjOiBIYW5nIFl1YW4gPGhhbmcueXVhbkBsaW51eC5pbnRlbC5jb20+DQo+ID4g
U3ViamVjdDogW1BBVENIXSBkcm0vaTkxNS9ndnQ6IHJlbW92ZSBjYWxsIHRyYWNlIGluIHBsYW5l
IHNjYWxpbmcNCj4gPiBoYW5kbGVyDQo+ID4NCj4gPiBGcm9tOiBIYW5nIFl1YW4gPGhhbmcueXVh
bkBsaW51eC5pbnRlbC5jb20+DQo+ID4NCj4gPiBPbiBndWVzdCBNTUlPIGFjY2VzcyB0byBzY2Fs
ZSBhIHBsYW5lLCBwcmludCBtZXNzYWdlIGJ1dCBubyBjYWxsIHRyYWNlDQo+ID4gZHVtcGVkLg0K
PiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogSGFuZyBZdWFuIDxoYW5nLnl1YW5AbGludXguaW50ZWwu
Y29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYyB8
IDMgKy0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMo
LSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxl
cnMuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMNCj4gPiBpbmRl
eCAxOGYwMWVlLi5kM2Q2Nzg4IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC9oYW5kbGVycy5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRs
ZXJzLmMNCj4gPiBAQCAtMTI5OCw4ICsxMjk4LDcgQEAgc3RhdGljIGludCBwZl93cml0ZShzdHJ1
Y3QgaW50ZWxfdmdwdSAqdmdwdSwNCj4gPiAgCWlmICgob2Zmc2V0ID09IF9QU18xQV9DVFJMIHx8
IG9mZnNldCA9PSBfUFNfMkFfQ1RSTCB8fA0KPiA+ICAJICAgb2Zmc2V0ID09IF9QU18xQl9DVFJM
IHx8IG9mZnNldCA9PSBfUFNfMkJfQ1RSTCB8fA0KPiA+ICAJICAgb2Zmc2V0ID09IF9QU18xQ19D
VFJMKSAmJiAodmFsICYgUFNfUExBTkVfU0VMX01BU0spICE9IDApIHsNCj4gPiAtCQlXQVJOX09O
Q0UodHJ1ZSwgIlZNKCVkKTogZ3Vlc3QgaXMgdHJ5aW5nIHRvIHNjYWxpbmcgYQ0KPiA+IHBsYW5l
XG4iLA0KPiA+IC0JCQkgIHZncHUtPmlkKTsNCj4gPiArCQlndnRfdmdwdV9lcnIoInVuc3VwcG9y
dGVkIGRpc3BsYXkgcGxhbmUgc2NhbGluZw0KPiA+IG9wZXJhdGlvblxuIik7DQo+ID4gIAkJcmV0
dXJuIDA7DQo+ID4gIAl9DQo+ID4NCj4gPiAtLQ0KPiA+IDIuNy40DQo+ID4NCj4gPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiA+IGludGVsLWd2dC1k
ZXYgbWFpbGluZyBsaXN0DQo+ID4gaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
Cj4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVs
LWd2dC1kZXYNCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18NCj4gaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QNCj4gaW50ZWwtZ3Z0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcNCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9pbnRlbC1ndnQtZGV2DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
