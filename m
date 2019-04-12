Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp144668ywo;
        Thu, 11 Apr 2019 22:43:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwrN+NhNsiT6G+ae+n3MAm6QNsOWK3NRbTIaMCw0vzpcWsjYsd2916aBlRge5iF9QnotNOo
X-Received: by 2002:a63:f115:: with SMTP id f21mr47754921pgi.65.1555047825696;
        Thu, 11 Apr 2019 22:43:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555047825; cv=none;
        d=google.com; s=arc-20160816;
        b=KNT0N8IorVGsTknxdExdygvgusM3U4dlTbEr/kHacXMMfUyNYdFvgSMtCsMfgTc0yA
         qq1uJ1d/CxS5TSMSJNEezfwYB/UL/h6VKcWV4NnaV1ZI3SBR8B0Hv7y6/8lUdxkIcbMh
         CB5LlL/PplA6sHkqNLqnyxOpCTgnogbxIr1T9hWMRBBPwsRG202im+UD+YjyU9pbAErg
         GQQfy3mdaAaL0n0Ba/OTyGvmv4VPHseL4VUBaLir2KMcPeUrJ6aqJSSsN7qHmHBZwJOa
         zLo8bfYYom34JypER6znAxUVT8XVK1QlCcuUYrkEHOkZHK17S0Mh3qLzjBj+/SmtlZUm
         EtuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:dlp-reaction:dlp-version:dlp-product
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:to:from:delivered-to;
        bh=V2OQGA9yJjUcqEZ3PMPYOgn3rRUxPVonctsuKioYLAI=;
        b=Z68z3Cbf9Umw5N9l9BDMPUceeDGgYLy2gLAboibTVFfntoh+AyIhQDA1qKW27KtQLV
         4Ewmf1e6br0HTLFkIfkUTfXLcmJcWAus/RHh8bvEGJ3DUQfCXDB2U4vuXbgStHSj7FoR
         EmHiHydCYKpsj9fS9VwnQv9lHO0Z9b/sJxlL3ETOFrxzXGmrO6D5Kb162jebJDPUmFo/
         87ywE4kPGDfHZ4d/0gEoJGR1p8g5H6qj2v+CL02urxaz1HhpMDYBSB9mkqPlZuM8PIRy
         aZywf/CQ+6v3VR8zJ60Gfezl/cNkkjGstsl9051/sXVmtuyFUH9oTG52J6D+vDJzEgKD
         Go8A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id b8si10832416pla.153.2019.04.11.22.43.44
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2019 22:43:45 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A82FF89312;
	Fri, 12 Apr 2019 05:43:44 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4CC089312
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 12 Apr 2019 05:43:43 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Apr 2019 22:43:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,340,1549958400"; d="scan'208";a="150200153"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by orsmga002.jf.intel.com with ESMTP; 11 Apr 2019 22:43:43 -0700
Received: from fmsmsx114.amr.corp.intel.com (10.18.116.8) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 11 Apr 2019 22:43:42 -0700
Received: from shsmsx107.ccr.corp.intel.com (10.239.4.96) by
 FMSMSX114.amr.corp.intel.com (10.18.116.8) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 11 Apr 2019 22:43:42 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.92]) by
 SHSMSX107.ccr.corp.intel.com ([169.254.9.153]) with mapi id 14.03.0415.000;
 Fri, 12 Apr 2019 13:43:40 +0800
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: "Xu, Colin" <colin.xu@intel.com>, "Gimbitskii, Aleksei"
 <aleksei.gimbitskii@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: RE: [PATCH V2 1/6] drm/i915/gvt: Remove typedef intel_gvt_gtt_type_t
Thread-Topic: [PATCH V2 1/6] drm/i915/gvt: Remove typedef intel_gvt_gtt_type_t
Thread-Index: AQHU8FP2ZFHTq8Sl40G+dMUSE+F/TaY3N44AgADLRyA=
Date: Fri, 12 Apr 2019 05:43:39 +0000
Message-ID: <F3B0350DF4CB6849A642218320DE483D7D9F95AC@SHSMSX104.ccr.corp.intel.com>
References: <20190411104631.7627-1-aleksei.gimbitskii@intel.com>
 <20190411104631.7627-2-aleksei.gimbitskii@intel.com>
 <91e9a249-f15d-b5cd-a718-51097de4637f@intel.com>
In-Reply-To: <91e9a249-f15d-b5cd-a718-51097de4637f@intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYzQ5OTUyNTctNDk3NS00NGNmLWFiYWUtZTBjNmYwNTEyMGJjIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiRVN4ZHhJcWd1eDRxYnNUcTBGWGFCUG1WQk9hQXNnSTFzUmJhTzFRdk9leEFYeXU2cElwNFJWTjJET0h6NjRSeSJ9
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
Cc: "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

SSB0aGluayBrbG9jd29yayBpcyBnb2luZyBhIGJpdCB0b28gZmFyIGFjdHVhbGx5LiBJdCBhbHdh
eXMgdGFrZXMgdGhlIGZ1bGwgcmFuZ2Ugd291bGQgYmUgdXNlZCBpZiB3ZSBnbyBlbnVtZXJhdGlv
biB0eXBlLiBGb3Igb3B0aW9uIDIsIEkgZ3Vlc3Mgd2UgaGF2ZSB0byBhZGQgYSBsb3Qgb2YgdXNl
bGVzcyBjaGVjayBvZiBHVFRfVFlQRV9JTlZBTElEIGluIGV2ZXJ5IHBsYWNlIHdlIGFyZSBnb2lu
ZyB0byB1c2UgdGhlIGVudW1lcmF0aW9uIGFzIGFycmF5IGluZGV4LCB3aGljaCBsb29rcyB2ZXJ5
IHVnbHkuDQoNCkknZCBsaWtlIHRvIGdvIHByYWN0aWNhbC4gV2UgbmVlZCB0aGUgZW51bWVyYXRp
b24gZm9yIHN1cmUgYW5kIHdlIGNoZWNrIHRoZSBHVFRfVFlQRV9JTlZBTElEIGluIHRoZSBwbGFj
ZSB3ZSB0aGluayBuZWNlc3NhcnkgYW5kIGxldCBjbG9ja3dvcmsgYmUgaGFwcHkgYW5kIGFsc28g
bm90IG1ha2UgdGhlIGNvZGUgdWdseS4NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZy
b206IFh1LCBDb2xpbiANClNlbnQ6IEZyaWRheSwgQXByaWwgMTIsIDIwMTkgNDoyOSBBTQ0KVG86
IEdpbWJpdHNraWksIEFsZWtzZWkgPGFsZWtzZWkuZ2ltYml0c2tpaUBpbnRlbC5jb20+OyBXYW5n
LCBaaGkgQSA8emhpLmEud2FuZ0BpbnRlbC5jb20+OyBaaGVueXUgV2FuZyA8emhlbnl1d0BsaW51
eC5pbnRlbC5jb20+DQpDYzogaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNClN1
YmplY3Q6IFJlOiBbUEFUQ0ggVjIgMS82XSBkcm0vaTkxNS9ndnQ6IFJlbW92ZSB0eXBlZGVmIGlu
dGVsX2d2dF9ndHRfdHlwZV90DQoNClNlZW1zIGxpa2UgVjIgb2YgdGhpcyBwYXRjaCBkb2Vzbid0
IGdldCB1cGRhdGVkPw0KDQpIaSBaaGksIFpoZW55dSwgZnJvbSBhcmNoaXRlY3R1cmUgcG9pbnQg
b2Ygdmlldywgd2hhdCBraW5kIG9mIGNoYW5nZSBpcyBiZXR0ZXI/DQotIENoYW5nZSBwYXJhbWV0
ZXIgdHlwZSBmcm9tIGVudW0gdHlwZSB0byBpbnQgbG9va3MgImNoZWF0IiBrbG9jd29yayBzdGF0
aWMgYW5hbHlzaXMsIGJ1dCBsb3NlIG5hdHVyYWwgcHJvdGVjdGlvbiBzaW5jZSBhbnkgaW50IGNv
dWxkIGJlIHBhc3NlZCBpbnRvIHRoZSBmdW5jdGlvbi4NCi0gSWYgd2Uga2VlcCB1c2luZyBlbnVt
IHR5cGUgYXMgdGhlIGZ1bmN0aW9uIHBhcmFtZXRlciwgd2UgbWF5IG5lZWQgZXh0cmFjdCBjaGVj
ayBzbyB0aGF0IGtsb2N3b3JrIHN0YXRpYyBhbmFseXNpcyB3aWxsIGNvbnNpZGVyIGFzIHNhZmUu
DQpBbnkgY29tbWVudHM/IEkgcHJlZmVyIHRoZSBsYXR0ZXIuDQoNCk9uIDIwMTktMDQtMTEgMTg6
NDYsIEFsZWtzZWkgR2ltYml0c2tpaSB3cm90ZToNCj4gVGhlIGtsb2N3b3JrIHN0YXRpYyBjb2Rl
IGFuYWx5emVyIHRha2VzIHRoZSBlbnVtZXJhdGlvbiBhcyB0aGUgZnVsbCANCj4gcmFuZ2Ugb2Yg
aW50ZWxfZ3Z0X2d0dF90eXBlX3QuIEJ1dCB0aGUgZnVsbCByYW5nZSBvZiANCj4gaW50ZWxfZ3Z0
X2d0dF90eXBlX3Qgd2lsbCBuZXZlciBiZSB1c2VkIGluIGZ1bGwgcmFuZ2UuIEZvciBleGFtcGxl
LCANCj4gdGhlIEdUVF9UWVBFX0lOVkFMSUQgd2lsbCBuZXZlciBiZSB1c2VkIGFzIGFuIGluZGV4
IG9mIGFuIGFycmF5LiBTbyB3ZSANCj4gd2lsbCBub3QgdXNlIGl0IGFzIGEgdHlwZSBidXQgb25s
eSB0aGUgZW51bWVyYXRpb24uDQo+DQo+IFRoaXMgcGF0Y2ggZml4ZWQgdGhlIGNyaXRpYWwgaXNz
dWVzICM0ODMsICM1NTEsICM2NjUgcmVwb3J0ZWQgYnkgDQo+IGtsb2Nrd29yay4NCj4NCj4gU2ln
bmVkLW9mZi1ieTogQWxla3NlaSBHaW1iaXRza2lpIDxhbGVrc2VpLmdpbWJpdHNraWlAaW50ZWwu
Y29tPg0KPiBDYzogWmhlbnl1IFdhbmcgPHpoZW55dXdAbGludXguaW50ZWwuY29tPg0KPiBDYzog
WmhpIFdhbmcgPHpoaS5hLndhbmdAaW50ZWwuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndnQvZ3R0LmMgfCAxMiArKysrKystLS0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndnQvZ3R0LmggfCAxNCArKysrKysrLS0tLS0tLQ0KPiAgIDIgZmlsZXMgY2hhbmdlZCwg
MTMgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMgDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0
L2d0dC5jIGluZGV4IDg4ZWQyZTlkZjI1My4uOGRjYjYyMjNiOTg1IA0KPiAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d2dC9ndHQuYw0KPiBAQCAtODA1LDcgKzgwNSw3IEBAIHN0YXRpYyBpbnQgcmVjbGFp
bV9vbmVfcHBndHRfbW0oc3RydWN0IGludGVsX2d2dCANCj4gKmd2dCk7DQo+ICAgDQo+ICAgLyog
QWxsb2NhdGUgc2hhZG93IHBhZ2UgdGFibGUgd2l0aG91dCBndWVzdCBwYWdlLiAqLw0KPiAgIHN0
YXRpYyBzdHJ1Y3QgaW50ZWxfdmdwdV9wcGd0dF9zcHQgKnBwZ3R0X2FsbG9jX3NwdCgNCj4gLQkJ
c3RydWN0IGludGVsX3ZncHUgKnZncHUsIGludGVsX2d2dF9ndHRfdHlwZV90IHR5cGUpDQo+ICsJ
CXN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LCBpbnQgdHlwZSkNCj4gICB7DQo+ICAgCXN0cnVjdCBk
ZXZpY2UgKmtkZXYgPSAmdmdwdS0+Z3Z0LT5kZXZfcHJpdi0+ZHJtLnBkZXYtPmRldjsNCj4gICAJ
c3RydWN0IGludGVsX3ZncHVfcHBndHRfc3B0ICpzcHQgPSBOVUxMOyBAQCAtODU1LDcgKzg1NSw3
IEBAIHN0YXRpYyANCj4gc3RydWN0IGludGVsX3ZncHVfcHBndHRfc3B0ICpwcGd0dF9hbGxvY19z
cHQoDQo+ICAgDQo+ICAgLyogQWxsb2NhdGUgc2hhZG93IHBhZ2UgdGFibGUgYXNzb2NpYXRlZCB3
aXRoIHNwZWNpZmljIGdmbi4gKi8NCj4gICBzdGF0aWMgc3RydWN0IGludGVsX3ZncHVfcHBndHRf
c3B0ICpwcGd0dF9hbGxvY19zcHRfZ2ZuKA0KPiAtCQlzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwg
aW50ZWxfZ3Z0X2d0dF90eXBlX3QgdHlwZSwNCj4gKwkJc3RydWN0IGludGVsX3ZncHUgKnZncHUs
IGludCB0eXBlLA0KPiAgIAkJdW5zaWduZWQgbG9uZyBnZm4sIGJvb2wgZ3Vlc3RfcGRlX2lwcykN
Cj4gICB7DQo+ICAgCXN0cnVjdCBpbnRlbF92Z3B1X3BwZ3R0X3NwdCAqc3B0Ow0KPiBAQCAtOTMw
LDcgKzkzMCw3IEBAIHN0YXRpYyBpbnQgcHBndHRfaW52YWxpZGF0ZV9zcHRfYnlfc2hhZG93X2Vu
dHJ5KHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LA0KPiAgIHsNCj4gICAJc3RydWN0IGludGVsX2d2
dF9ndHRfcHRlX29wcyAqb3BzID0gdmdwdS0+Z3Z0LT5ndHQucHRlX29wczsNCj4gICAJc3RydWN0
IGludGVsX3ZncHVfcHBndHRfc3B0ICpzOw0KPiAtCWludGVsX2d2dF9ndHRfdHlwZV90IGN1cl9w
dF90eXBlOw0KPiArCWludCBjdXJfcHRfdHlwZTsNCj4gICANCj4gICAJR0VNX0JVR19PTighZ3R0
X3R5cGVfaXNfcHQoZ2V0X25leHRfcHRfdHlwZShlLT50eXBlKSkpOw0KPiAgIA0KPiBAQCAtMTg0
OSw3ICsxODQ5LDcgQEAgc3RhdGljIHZvaWQgdmdwdV9mcmVlX21tKHN0cnVjdCBpbnRlbF92Z3B1
X21tICptbSkNCj4gICAgKiBaZXJvIG9uIHN1Y2Nlc3MsIG5lZ2F0aXZlIGVycm9yIGNvZGUgaW4g
cG9pbnRlciBpZiBmYWlsZWQuDQo+ICAgICovDQo+ICAgc3RydWN0IGludGVsX3ZncHVfbW0gKmlu
dGVsX3ZncHVfY3JlYXRlX3BwZ3R0X21tKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LA0KPiAtCQlp
bnRlbF9ndnRfZ3R0X3R5cGVfdCByb290X2VudHJ5X3R5cGUsIHU2NCBwZHBzW10pDQo+ICsJCWlu
dCByb290X2VudHJ5X3R5cGUsIHU2NCBwZHBzW10pDQo+ICAgew0KPiAgIAlzdHJ1Y3QgaW50ZWxf
Z3Z0ICpndnQgPSB2Z3B1LT5ndnQ7DQo+ICAgCXN0cnVjdCBpbnRlbF92Z3B1X21tICptbTsNCj4g
QEAgLTIzMDMsNyArMjMwMyw3IEBAIGludCBpbnRlbF92Z3B1X2VtdWxhdGVfZ2d0dF9tbWlvX3dy
aXRlKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LA0KPiAgIH0NCj4gICANCj4gICBzdGF0aWMgaW50
IGFsbG9jX3NjcmF0Y2hfcGFnZXMoc3RydWN0IGludGVsX3ZncHUgKnZncHUsDQo+IC0JCWludGVs
X2d2dF9ndHRfdHlwZV90IHR5cGUpDQo+ICsJCWludCB0eXBlKQ0KPiAgIHsNCj4gICAJc3RydWN0
IGludGVsX3ZncHVfZ3R0ICpndHQgPSAmdmdwdS0+Z3R0Ow0KPiAgIAlzdHJ1Y3QgaW50ZWxfZ3Z0
X2d0dF9wdGVfb3BzICpvcHMgPSB2Z3B1LT5ndnQtPmd0dC5wdGVfb3BzOyBAQCANCj4gLTI1ODgs
NyArMjU4OCw3IEBAIHN0cnVjdCBpbnRlbF92Z3B1X21tICppbnRlbF92Z3B1X2ZpbmRfcHBndHRf
bW0oc3RydWN0IGludGVsX3ZncHUgKnZncHUsDQo+ICAgICogWmVybyBvbiBzdWNjZXNzLCBuZWdh
dGl2ZSBlcnJvciBjb2RlIGlmIGZhaWxlZC4NCj4gICAgKi8NCj4gICBzdHJ1Y3QgaW50ZWxfdmdw
dV9tbSAqaW50ZWxfdmdwdV9nZXRfcHBndHRfbW0oc3RydWN0IGludGVsX3ZncHUgKnZncHUsDQo+
IC0JCWludGVsX2d2dF9ndHRfdHlwZV90IHJvb3RfZW50cnlfdHlwZSwgdTY0IHBkcHNbXSkNCj4g
KwkJaW50IHJvb3RfZW50cnlfdHlwZSwgdTY0IHBkcHNbXSkNCj4gICB7DQo+ICAgCXN0cnVjdCBp
bnRlbF92Z3B1X21tICptbTsNCj4gICANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2d2dC9ndHQuaCANCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmggaW5kZXgg
MzJjNTczYWVhNDk0Li42NDVkZGMxYmQyMjMgDQo+IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndnQvZ3R0LmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0
dC5oDQo+IEBAIC05NSw3ICs5NSw3IEBAIHN0cnVjdCBpbnRlbF9ndnRfZ3R0IHsNCj4gICAJdW5z
aWduZWQgbG9uZyBzY3JhdGNoX21mbjsNCj4gICB9Ow0KPiAgIA0KPiAtdHlwZWRlZiBlbnVtIHsN
Cj4gK2VudW0gew0KPiAgIAlHVFRfVFlQRV9JTlZBTElEID0gLTEsDQo+ICAgDQo+ICAgCUdUVF9U
WVBFX0dHVFRfUFRFLA0KPiBAQCAtMTI0LDcgKzEyNCw3IEBAIHR5cGVkZWYgZW51bSB7DQo+ICAg
CUdUVF9UWVBFX1BQR1RUX1BNTDRfUFQsDQo+ICAgDQo+ICAgCUdUVF9UWVBFX01BWCwNCj4gLX0g
aW50ZWxfZ3Z0X2d0dF90eXBlX3Q7DQo+ICt9Ow0KPiAgIA0KPiAgIGVudW0gaW50ZWxfZ3Z0X21t
X3R5cGUgew0KPiAgIAlJTlRFTF9HVlRfTU1fR0dUVCwNCj4gQEAgLTE0OCw3ICsxNDgsNyBAQCBz
dHJ1Y3QgaW50ZWxfdmdwdV9tbSB7DQo+ICAgDQo+ICAgCXVuaW9uIHsNCj4gICAJCXN0cnVjdCB7
DQo+IC0JCQlpbnRlbF9ndnRfZ3R0X3R5cGVfdCByb290X2VudHJ5X3R5cGU7DQo+ICsJCQlpbnQg
cm9vdF9lbnRyeV90eXBlOw0KPiAgIAkJCS8qDQo+ICAgCQkJICogVGhlIDQgUERQcyBpbiByaW5n
IGNvbnRleHQuIEZvciA0OGJpdCBhZGRyZXNzaW5nLA0KPiAgIAkJCSAqIG9ubHkgUERQMCBpcyB2
YWxpZCBhbmQgcG9pbnQgdG8gUE1MNC4gRm9yIDMyaXQgQEAgLTE2OSw3IA0KPiArMTY5LDcgQEAg
c3RydWN0IGludGVsX3ZncHVfbW0gew0KPiAgIH07DQo+ICAgDQo+ICAgc3RydWN0IGludGVsX3Zn
cHVfbW0gKmludGVsX3ZncHVfY3JlYXRlX3BwZ3R0X21tKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1
LA0KPiAtCQlpbnRlbF9ndnRfZ3R0X3R5cGVfdCByb290X2VudHJ5X3R5cGUsIHU2NCBwZHBzW10p
Ow0KPiArCQlpbnQgcm9vdF9lbnRyeV90eXBlLCB1NjQgcGRwc1tdKTsNCj4gICANCj4gICBzdGF0
aWMgaW5saW5lIHZvaWQgaW50ZWxfdmdwdV9tbV9nZXQoc3RydWN0IGludGVsX3ZncHVfbW0gKm1t
KQ0KPiAgIHsNCj4gQEAgLTIzMyw3ICsyMzMsNyBAQCBzdHJ1Y3QgaW50ZWxfdmdwdV9wcGd0dF9z
cHQgew0KPiAgIAlzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdTsNCj4gICANCj4gICAJc3RydWN0IHsN
Cj4gLQkJaW50ZWxfZ3Z0X2d0dF90eXBlX3QgdHlwZTsNCj4gKwkJaW50IHR5cGU7DQo+ICAgCQli
b29sIHBkZV9pcHM7IC8qIGZvciA2NEtCIFBURXMgKi8NCj4gICAJCXZvaWQgKnZhZGRyOw0KPiAg
IAkJc3RydWN0IHBhZ2UgKnBhZ2U7DQo+IEBAIC0yNDEsNyArMjQxLDcgQEAgc3RydWN0IGludGVs
X3ZncHVfcHBndHRfc3B0IHsNCj4gICAJfSBzaGFkb3dfcGFnZTsNCj4gICANCj4gICAJc3RydWN0
IHsNCj4gLQkJaW50ZWxfZ3Z0X2d0dF90eXBlX3QgdHlwZTsNCj4gKwkJaW50IHR5cGU7DQo+ICAg
CQlib29sIHBkZV9pcHM7IC8qIGZvciA2NEtCIFBURXMgKi8NCj4gICAJCXVuc2lnbmVkIGxvbmcg
Z2ZuOw0KPiAgIAkJdW5zaWduZWQgbG9uZyB3cml0ZV9jbnQ7DQo+IEBAIC0yNjcsNyArMjY3LDcg
QEAgc3RydWN0IGludGVsX3ZncHVfbW0gKmludGVsX3ZncHVfZmluZF9wcGd0dF9tbShzdHJ1Y3Qg
aW50ZWxfdmdwdSAqdmdwdSwNCj4gICAJCXU2NCBwZHBzW10pOw0KPiAgIA0KPiAgIHN0cnVjdCBp
bnRlbF92Z3B1X21tICppbnRlbF92Z3B1X2dldF9wcGd0dF9tbShzdHJ1Y3QgaW50ZWxfdmdwdSAq
dmdwdSwNCj4gLQkJaW50ZWxfZ3Z0X2d0dF90eXBlX3Qgcm9vdF9lbnRyeV90eXBlLCB1NjQgcGRw
c1tdKTsNCj4gKwkJaW50IHJvb3RfZW50cnlfdHlwZSwgdTY0IHBkcHNbXSk7DQo+ICAgDQo+ICAg
aW50IGludGVsX3ZncHVfcHV0X3BwZ3R0X21tKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LCB1NjQg
cGRwc1tdKTsNCj4gICANCg0KLS0NCkJlc3QgUmVnYXJkcywNCkNvbGluIFh1DQoNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFp
bGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
