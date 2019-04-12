Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp174068ywo;
        Thu, 11 Apr 2019 23:20:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzO2DPNn5hYUcbHZOxk/ughYa4X1TVfxtiycLE3RED7+Sf7MaUSKupcxG4JNz5AqBsRG/t6
X-Received: by 2002:a63:df12:: with SMTP id u18mr51846623pgg.135.1555050032351;
        Thu, 11 Apr 2019 23:20:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555050032; cv=none;
        d=google.com; s=arc-20160816;
        b=TyGX4SipnZpIZVziZxiKoCYYHojfhDqyk/yGnerq3n88O9den2cX53qpM/DBfbnk3f
         lvI0EHScJmXofrB6NCBDFx4UfEzwp23/nAO97WuIhnx3YRZhlEiM0XlM8M838GFEd78P
         pHk364rMgJqwCEjJeXINHHoX/qzjB26P+qVj3jj2q+/SQBm+P+UvgnugVvQV6D8LUmZX
         P9gghzfOxn4fiiXp/tuRJBLATuKn1/NmoC3wxU4rdUw7xstLtxa9QrDH/NYsrRd7ND/w
         Z0xjc1VTqv+0rOH2qVoB4jz/xWPYUdkLIW/IGbsV0t5aTMR7aCPbuq683L+gckS0+kM+
         FP1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:dlp-reaction:dlp-version:dlp-product
         :content-language:accept-language:references:message-id:date
         :thread-index:thread-topic:subject:to:from:delivered-to;
        bh=3ebyx+SdAeWe6gHo3ooelFGx1A9dOei4k2pOL5Z4Lss=;
        b=QgGA6WRHJkz3xGPvo28wf20R4v+mfv+pn0IWdixYX7OM9LICDepiPJ4naWN+HJvI8g
         yRH8FToWCQeGkfGIZBFJr0q+AwBcALRzTX5FNHl8+KOux4eCwrZvGxKSYaGNc0rEjus6
         VqpssCX0JhHgq+ScBKSGixgKzisDLLUScZGkzntGjdB21Lyps8sGeZ+mouvoSJa0ES7u
         1GYNqtV90o4+0aHmzKPJY6poZtVdc9EOgIVMWfvvrzpITHg+pOzDFXnCjVWTK1lmqNRP
         zIbY81bcZI2O4ygI2yZ3Kj8LwFqzMKHunjFknHbewhs+okFViLd5ckm4Msg4LqSXSaQW
         D0xA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id m3si27667750pgv.28.2019.04.11.23.20.31
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2019 23:20:32 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50853896C4;
	Fri, 12 Apr 2019 06:20:31 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 618DF896C4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 12 Apr 2019 06:20:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Apr 2019 23:20:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,340,1549958400"; d="scan'208";a="336107606"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by fmsmga006.fm.intel.com with ESMTP; 11 Apr 2019 23:20:29 -0700
Received: from fmsmsx120.amr.corp.intel.com (10.18.124.208) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 11 Apr 2019 23:20:29 -0700
Received: from shsmsx106.ccr.corp.intel.com (10.239.4.159) by
 fmsmsx120.amr.corp.intel.com (10.18.124.208) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 11 Apr 2019 23:20:28 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.92]) by
 SHSMSX106.ccr.corp.intel.com ([169.254.10.21]) with mapi id 14.03.0415.000;
 Fri, 12 Apr 2019 14:20:27 +0800
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: "Xu, Colin" <colin.xu@intel.com>, "Gimbitskii, Aleksei"
 <aleksei.gimbitskii@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: RE: [PATCH V2 1/6] drm/i915/gvt: Remove typedef intel_gvt_gtt_type_t
Thread-Topic: [PATCH V2 1/6] drm/i915/gvt: Remove typedef intel_gvt_gtt_type_t
Thread-Index: AQHU8FP2ZFHTq8Sl40G+dMUSE+F/TaY3N44AgADLRyCAAAvywA==
Date: Fri, 12 Apr 2019 06:20:26 +0000
Message-ID: <F3B0350DF4CB6849A642218320DE483D7D9F95F5@SHSMSX104.ccr.corp.intel.com>
References: <20190411104631.7627-1-aleksei.gimbitskii@intel.com>
 <20190411104631.7627-2-aleksei.gimbitskii@intel.com>
 <91e9a249-f15d-b5cd-a718-51097de4637f@intel.com> 
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

QWxzbywgdGhlIG90aGVyIHJlYXNvbiB0byByZW1vdmUgdGhlIHR5cGVkZWYgaXM6DQpodHRwczov
L3lhcmNoaXZlLm5ldC9jb21wL2xpbnV4L3R5cGVkZWZzLmh0bWwNCg0KaTkxNSBoYXMgYWxyZWFk
eSByZW1vdmVkIGFsbW9zdCBhbGwgb2YgdGhlbSBiZWNhdXNlIG9mIHRoaXMuDQoNClRoYW5rcywN
ClpoaQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogV2FuZywgWmhpIEEgDQpT
ZW50OiBGcmlkYXksIEFwcmlsIDEyLCAyMDE5IDg6NDQgQU0NClRvOiBYdSwgQ29saW4gPGNvbGlu
Lnh1QGludGVsLmNvbT47IEdpbWJpdHNraWksIEFsZWtzZWkgPGFsZWtzZWkuZ2ltYml0c2tpaUBp
bnRlbC5jb20+OyBaaGVueXUgV2FuZyA8emhlbnl1d0BsaW51eC5pbnRlbC5jb20+DQpDYzogaW50
ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNClN1YmplY3Q6IFJFOiBbUEFUQ0ggVjIg
MS82XSBkcm0vaTkxNS9ndnQ6IFJlbW92ZSB0eXBlZGVmIGludGVsX2d2dF9ndHRfdHlwZV90DQoN
CkkgdGhpbmsga2xvY3dvcmsgaXMgZ29pbmcgYSBiaXQgdG9vIGZhciBhY3R1YWxseS4gSXQgYWx3
YXlzIHRha2VzIHRoZSBmdWxsIHJhbmdlIHdvdWxkIGJlIHVzZWQgaWYgd2UgZ28gZW51bWVyYXRp
b24gdHlwZS4gRm9yIG9wdGlvbiAyLCBJIGd1ZXNzIHdlIGhhdmUgdG8gYWRkIGEgbG90IG9mIHVz
ZWxlc3MgY2hlY2sgb2YgR1RUX1RZUEVfSU5WQUxJRCBpbiBldmVyeSBwbGFjZSB3ZSBhcmUgZ29p
bmcgdG8gdXNlIHRoZSBlbnVtZXJhdGlvbiBhcyBhcnJheSBpbmRleCwgd2hpY2ggbG9va3MgdmVy
eSB1Z2x5Lg0KDQpJJ2QgbGlrZSB0byBnbyBwcmFjdGljYWwuIFdlIG5lZWQgdGhlIGVudW1lcmF0
aW9uIGZvciBzdXJlIGFuZCB3ZSBjaGVjayB0aGUgR1RUX1RZUEVfSU5WQUxJRCBpbiB0aGUgcGxh
Y2Ugd2UgdGhpbmsgbmVjZXNzYXJ5IGFuZCBsZXQgY2xvY2t3b3JrIGJlIGhhcHB5IGFuZCBhbHNv
IG5vdCBtYWtlIHRoZSBjb2RlIHVnbHkuDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpG
cm9tOiBYdSwgQ29saW4NClNlbnQ6IEZyaWRheSwgQXByaWwgMTIsIDIwMTkgNDoyOSBBTQ0KVG86
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
L2d0dC5jIGluZGV4IDg4ZWQyZTlkZjI1My4uOGRjYjYyMjNiOTg1DQo+IDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Z0L2d0dC5jDQo+IEBAIC04MDUsNyArODA1LDcgQEAgc3RhdGljIGludCByZWNsYWlt
X29uZV9wcGd0dF9tbShzdHJ1Y3QgaW50ZWxfZ3Z0IA0KPiAqZ3Z0KTsNCj4gICANCj4gICAvKiBB
bGxvY2F0ZSBzaGFkb3cgcGFnZSB0YWJsZSB3aXRob3V0IGd1ZXN0IHBhZ2UuICovDQo+ICAgc3Rh
dGljIHN0cnVjdCBpbnRlbF92Z3B1X3BwZ3R0X3NwdCAqcHBndHRfYWxsb2Nfc3B0KA0KPiAtCQlz
dHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwgaW50ZWxfZ3Z0X2d0dF90eXBlX3QgdHlwZSkNCj4gKwkJ
c3RydWN0IGludGVsX3ZncHUgKnZncHUsIGludCB0eXBlKQ0KPiAgIHsNCj4gICAJc3RydWN0IGRl
dmljZSAqa2RldiA9ICZ2Z3B1LT5ndnQtPmRldl9wcml2LT5kcm0ucGRldi0+ZGV2Ow0KPiAgIAlz
dHJ1Y3QgaW50ZWxfdmdwdV9wcGd0dF9zcHQgKnNwdCA9IE5VTEw7IEBAIC04NTUsNyArODU1LDcg
QEAgc3RhdGljIA0KPiBzdHJ1Y3QgaW50ZWxfdmdwdV9wcGd0dF9zcHQgKnBwZ3R0X2FsbG9jX3Nw
dCgNCj4gICANCj4gICAvKiBBbGxvY2F0ZSBzaGFkb3cgcGFnZSB0YWJsZSBhc3NvY2lhdGVkIHdp
dGggc3BlY2lmaWMgZ2ZuLiAqLw0KPiAgIHN0YXRpYyBzdHJ1Y3QgaW50ZWxfdmdwdV9wcGd0dF9z
cHQgKnBwZ3R0X2FsbG9jX3NwdF9nZm4oDQo+IC0JCXN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LCBp
bnRlbF9ndnRfZ3R0X3R5cGVfdCB0eXBlLA0KPiArCQlzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwg
aW50IHR5cGUsDQo+ICAgCQl1bnNpZ25lZCBsb25nIGdmbiwgYm9vbCBndWVzdF9wZGVfaXBzKQ0K
PiAgIHsNCj4gICAJc3RydWN0IGludGVsX3ZncHVfcHBndHRfc3B0ICpzcHQ7DQo+IEBAIC05MzAs
NyArOTMwLDcgQEAgc3RhdGljIGludCBwcGd0dF9pbnZhbGlkYXRlX3NwdF9ieV9zaGFkb3dfZW50
cnkoc3RydWN0IGludGVsX3ZncHUgKnZncHUsDQo+ICAgew0KPiAgIAlzdHJ1Y3QgaW50ZWxfZ3Z0
X2d0dF9wdGVfb3BzICpvcHMgPSB2Z3B1LT5ndnQtPmd0dC5wdGVfb3BzOw0KPiAgIAlzdHJ1Y3Qg
aW50ZWxfdmdwdV9wcGd0dF9zcHQgKnM7DQo+IC0JaW50ZWxfZ3Z0X2d0dF90eXBlX3QgY3VyX3B0
X3R5cGU7DQo+ICsJaW50IGN1cl9wdF90eXBlOw0KPiAgIA0KPiAgIAlHRU1fQlVHX09OKCFndHRf
dHlwZV9pc19wdChnZXRfbmV4dF9wdF90eXBlKGUtPnR5cGUpKSk7DQo+ICAgDQo+IEBAIC0xODQ5
LDcgKzE4NDksNyBAQCBzdGF0aWMgdm9pZCB2Z3B1X2ZyZWVfbW0oc3RydWN0IGludGVsX3ZncHVf
bW0gKm1tKQ0KPiAgICAqIFplcm8gb24gc3VjY2VzcywgbmVnYXRpdmUgZXJyb3IgY29kZSBpbiBw
b2ludGVyIGlmIGZhaWxlZC4NCj4gICAgKi8NCj4gICBzdHJ1Y3QgaW50ZWxfdmdwdV9tbSAqaW50
ZWxfdmdwdV9jcmVhdGVfcHBndHRfbW0oc3RydWN0IGludGVsX3ZncHUgKnZncHUsDQo+IC0JCWlu
dGVsX2d2dF9ndHRfdHlwZV90IHJvb3RfZW50cnlfdHlwZSwgdTY0IHBkcHNbXSkNCj4gKwkJaW50
IHJvb3RfZW50cnlfdHlwZSwgdTY0IHBkcHNbXSkNCj4gICB7DQo+ICAgCXN0cnVjdCBpbnRlbF9n
dnQgKmd2dCA9IHZncHUtPmd2dDsNCj4gICAJc3RydWN0IGludGVsX3ZncHVfbW0gKm1tOw0KPiBA
QCAtMjMwMyw3ICsyMzAzLDcgQEAgaW50IGludGVsX3ZncHVfZW11bGF0ZV9nZ3R0X21taW9fd3Jp
dGUoc3RydWN0IGludGVsX3ZncHUgKnZncHUsDQo+ICAgfQ0KPiAgIA0KPiAgIHN0YXRpYyBpbnQg
YWxsb2Nfc2NyYXRjaF9wYWdlcyhzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwNCj4gLQkJaW50ZWxf
Z3Z0X2d0dF90eXBlX3QgdHlwZSkNCj4gKwkJaW50IHR5cGUpDQo+ICAgew0KPiAgIAlzdHJ1Y3Qg
aW50ZWxfdmdwdV9ndHQgKmd0dCA9ICZ2Z3B1LT5ndHQ7DQo+ICAgCXN0cnVjdCBpbnRlbF9ndnRf
Z3R0X3B0ZV9vcHMgKm9wcyA9IHZncHUtPmd2dC0+Z3R0LnB0ZV9vcHM7IEBADQo+IC0yNTg4LDcg
KzI1ODgsNyBAQCBzdHJ1Y3QgaW50ZWxfdmdwdV9tbSAqaW50ZWxfdmdwdV9maW5kX3BwZ3R0X21t
KHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LA0KPiAgICAqIFplcm8gb24gc3VjY2VzcywgbmVnYXRp
dmUgZXJyb3IgY29kZSBpZiBmYWlsZWQuDQo+ICAgICovDQo+ICAgc3RydWN0IGludGVsX3ZncHVf
bW0gKmludGVsX3ZncHVfZ2V0X3BwZ3R0X21tKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LA0KPiAt
CQlpbnRlbF9ndnRfZ3R0X3R5cGVfdCByb290X2VudHJ5X3R5cGUsIHU2NCBwZHBzW10pDQo+ICsJ
CWludCByb290X2VudHJ5X3R5cGUsIHU2NCBwZHBzW10pDQo+ICAgew0KPiAgIAlzdHJ1Y3QgaW50
ZWxfdmdwdV9tbSAqbW07DQo+ICAgDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndnQvZ3R0LmggDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5oIGluZGV4IDMy
YzU3M2FlYTQ5NC4uNjQ1ZGRjMWJkMjIzDQo+IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndnQvZ3R0LmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5o
DQo+IEBAIC05NSw3ICs5NSw3IEBAIHN0cnVjdCBpbnRlbF9ndnRfZ3R0IHsNCj4gICAJdW5zaWdu
ZWQgbG9uZyBzY3JhdGNoX21mbjsNCj4gICB9Ow0KPiAgIA0KPiAtdHlwZWRlZiBlbnVtIHsNCj4g
K2VudW0gew0KPiAgIAlHVFRfVFlQRV9JTlZBTElEID0gLTEsDQo+ICAgDQo+ICAgCUdUVF9UWVBF
X0dHVFRfUFRFLA0KPiBAQCAtMTI0LDcgKzEyNCw3IEBAIHR5cGVkZWYgZW51bSB7DQo+ICAgCUdU
VF9UWVBFX1BQR1RUX1BNTDRfUFQsDQo+ICAgDQo+ICAgCUdUVF9UWVBFX01BWCwNCj4gLX0gaW50
ZWxfZ3Z0X2d0dF90eXBlX3Q7DQo+ICt9Ow0KPiAgIA0KPiAgIGVudW0gaW50ZWxfZ3Z0X21tX3R5
cGUgew0KPiAgIAlJTlRFTF9HVlRfTU1fR0dUVCwNCj4gQEAgLTE0OCw3ICsxNDgsNyBAQCBzdHJ1
Y3QgaW50ZWxfdmdwdV9tbSB7DQo+ICAgDQo+ICAgCXVuaW9uIHsNCj4gICAJCXN0cnVjdCB7DQo+
IC0JCQlpbnRlbF9ndnRfZ3R0X3R5cGVfdCByb290X2VudHJ5X3R5cGU7DQo+ICsJCQlpbnQgcm9v
dF9lbnRyeV90eXBlOw0KPiAgIAkJCS8qDQo+ICAgCQkJICogVGhlIDQgUERQcyBpbiByaW5nIGNv
bnRleHQuIEZvciA0OGJpdCBhZGRyZXNzaW5nLA0KPiAgIAkJCSAqIG9ubHkgUERQMCBpcyB2YWxp
ZCBhbmQgcG9pbnQgdG8gUE1MNC4gRm9yIDMyaXQgQEAgLTE2OSw3DQo+ICsxNjksNyBAQCBzdHJ1
Y3QgaW50ZWxfdmdwdV9tbSB7DQo+ICAgfTsNCj4gICANCj4gICBzdHJ1Y3QgaW50ZWxfdmdwdV9t
bSAqaW50ZWxfdmdwdV9jcmVhdGVfcHBndHRfbW0oc3RydWN0IGludGVsX3ZncHUgKnZncHUsDQo+
IC0JCWludGVsX2d2dF9ndHRfdHlwZV90IHJvb3RfZW50cnlfdHlwZSwgdTY0IHBkcHNbXSk7DQo+
ICsJCWludCByb290X2VudHJ5X3R5cGUsIHU2NCBwZHBzW10pOw0KPiAgIA0KPiAgIHN0YXRpYyBp
bmxpbmUgdm9pZCBpbnRlbF92Z3B1X21tX2dldChzdHJ1Y3QgaW50ZWxfdmdwdV9tbSAqbW0pDQo+
ICAgew0KPiBAQCAtMjMzLDcgKzIzMyw3IEBAIHN0cnVjdCBpbnRlbF92Z3B1X3BwZ3R0X3NwdCB7
DQo+ICAgCXN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1Ow0KPiAgIA0KPiAgIAlzdHJ1Y3Qgew0KPiAt
CQlpbnRlbF9ndnRfZ3R0X3R5cGVfdCB0eXBlOw0KPiArCQlpbnQgdHlwZTsNCj4gICAJCWJvb2wg
cGRlX2lwczsgLyogZm9yIDY0S0IgUFRFcyAqLw0KPiAgIAkJdm9pZCAqdmFkZHI7DQo+ICAgCQlz
dHJ1Y3QgcGFnZSAqcGFnZTsNCj4gQEAgLTI0MSw3ICsyNDEsNyBAQCBzdHJ1Y3QgaW50ZWxfdmdw
dV9wcGd0dF9zcHQgew0KPiAgIAl9IHNoYWRvd19wYWdlOw0KPiAgIA0KPiAgIAlzdHJ1Y3Qgew0K
PiAtCQlpbnRlbF9ndnRfZ3R0X3R5cGVfdCB0eXBlOw0KPiArCQlpbnQgdHlwZTsNCj4gICAJCWJv
b2wgcGRlX2lwczsgLyogZm9yIDY0S0IgUFRFcyAqLw0KPiAgIAkJdW5zaWduZWQgbG9uZyBnZm47
DQo+ICAgCQl1bnNpZ25lZCBsb25nIHdyaXRlX2NudDsNCj4gQEAgLTI2Nyw3ICsyNjcsNyBAQCBz
dHJ1Y3QgaW50ZWxfdmdwdV9tbSAqaW50ZWxfdmdwdV9maW5kX3BwZ3R0X21tKHN0cnVjdCBpbnRl
bF92Z3B1ICp2Z3B1LA0KPiAgIAkJdTY0IHBkcHNbXSk7DQo+ICAgDQo+ICAgc3RydWN0IGludGVs
X3ZncHVfbW0gKmludGVsX3ZncHVfZ2V0X3BwZ3R0X21tKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1
LA0KPiAtCQlpbnRlbF9ndnRfZ3R0X3R5cGVfdCByb290X2VudHJ5X3R5cGUsIHU2NCBwZHBzW10p
Ow0KPiArCQlpbnQgcm9vdF9lbnRyeV90eXBlLCB1NjQgcGRwc1tdKTsNCj4gICANCj4gICBpbnQg
aW50ZWxfdmdwdV9wdXRfcHBndHRfbW0oc3RydWN0IGludGVsX3ZncHUgKnZncHUsIHU2NCBwZHBz
W10pOw0KPiAgIA0KDQotLQ0KQmVzdCBSZWdhcmRzLA0KQ29saW4gWHUNCg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5n
IGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
