Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp4408648ywo;
        Tue, 9 Apr 2019 03:40:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy+1vMI3Bjy3aJR9JR9d8eIv26eyU9jp8t6UfmZGN1R1x4h5qqztrgAquH/06lkSseVzZoO
X-Received: by 2002:a63:6988:: with SMTP id e130mr17473854pgc.150.1554806428995;
        Tue, 09 Apr 2019 03:40:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554806428; cv=none;
        d=google.com; s=arc-20160816;
        b=WxCbQJLRVAnHSmlc+nKAcVFr0nmBococvz22MPwSsRhaUxE0vClBUR99kkN1hUvAFN
         u72eZRU4YrkU2mDECmknEF13AlHNmqxUErjb8IreiVH4dGSCVZnLEsEsR8Rh0KDjZdGj
         0WzylY/osjPT0xITBTs2t3+sdHeIyGEBJWHUd9ZNJ2HPqWiunFYv0Y1RPDAotag3ne8Q
         oSzoA5d6xDgK/SgA2Q2ycNvVWz0ZlVxNgiXWM81EVTa5q746QtzYfU++qj2PVBWDlr1s
         8vyuptJX2VLI21N+AKcPB87wgCMw4CK/PpKdyOzskpBD+YVu+/DParMRTiCN0cAcNByi
         oWTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:dlp-reaction:dlp-version:dlp-product
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:to:from:delivered-to;
        bh=jA2neknzgQGJTRcSse455yM7xr9n01CQsg7CYuBGrq4=;
        b=VGCM8dOO+gtkQFsZUyo6Z1HiXtGidVc2IlKZTjtxDzjIL/GewRmgXjaLGaVhjjsTDm
         5SGZlw9gS5AKTMj+HFgYvjelBNJAcFxa4uzz2kv3tnsNRMHKUQPZidWiOhgxU93vfnoc
         NgJ1fnhCiLD/6D0YuHY+0ZXcrQDl0xiyGuoAsq1CX/ONI6MZwruKkLF7zxT/bj3bItv8
         ujesx7u46dcaAmTZ9gFvhCUIyQYCoANPN8EJrSdZJVsdw+xOug2ijNTQl43aLMv2RjAr
         PFGOoEZI3pKv5BcgERSzOg2EA0iuUpm7fcFkxg4S4jLXixP6TWgxQv/Tzxxs5h9IWT8Y
         s0TA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id p9si28746695pff.52.2019.04.09.03.40.28
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Apr 2019 03:40:28 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A65890A5;
	Tue,  9 Apr 2019 10:40:28 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F08A3890A5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  9 Apr 2019 10:40:26 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Apr 2019 03:40:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,329,1549958400"; d="scan'208";a="149296643"
Received: from irsmsx110.ger.corp.intel.com ([163.33.3.25])
 by orsmga002.jf.intel.com with ESMTP; 09 Apr 2019 03:40:23 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.31]) by
 irsmsx110.ger.corp.intel.com ([169.254.15.173]) with mapi id 14.03.0415.000;
 Tue, 9 Apr 2019 11:40:10 +0100
From: "Gimbitskii, Aleksei" <aleksei.gimbitskii@intel.com>
To: "Xu, Colin" <colin.xu@intel.com>, "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>
Subject: RE: [PATCH 2/5] drm/i915/gvt: Do not copy the uninitialized pointer
 from fb_info
Thread-Topic: [PATCH 2/5] drm/i915/gvt: Do not copy the uninitialized
 pointer from fb_info
Thread-Index: AQHU7dAMUjezL8D/8UKkFyjcUQZtiKYxxpWAgAHezPA=
Date: Tue, 9 Apr 2019 10:40:10 +0000
Message-ID: <1EB9BA72F2F5144BB1A5812E11248EAD18E1293A@irsmsx105.ger.corp.intel.com>
References: <20190408055502.8474-1-aleksei.gimbitskii@intel.com>
 <20190408055502.8474-2-aleksei.gimbitskii@intel.com>
 <e389a02a-80ec-633b-3325-df55cb83366f@intel.com>
In-Reply-To: <e389a02a-80ec-633b-3325-df55cb83366f@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMGQyMjBiYjMtZTZkMi00OGI0LThlM2MtYmUyYTJhNDM0YzVlIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoieEU3RkRXN29PVXkzamtzUVFsb2tuZEJ0VU9iWThEVDhBRjdsMTEzbXg3SDRQTWdGeDR2WThQbE1pMXBEeDYrViJ9
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [163.33.239.182]
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
Cc: Zhenyu Wang <zhenyuw@linux.intel.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VGhhbmtzIGZvciB5b3UgcHJvcG9zYWwuIEFzIHlvdSByZWNvbW1lbmRlZCwgaW4gbmV4dCBwYXRj
aCB2ZXJzaW9uIEkgd2lsbCBpbml0aWFsaXplIGZiX2luZm8ub2JqIGluIHZncHVfZ2V0X3BsYW5l
X2luZm8oKSwgaXQgc29sdmVzIHRoaXMgaXNzdWUgaW4gYmV0dGVyIG1hbm5lciBhbmQgbW9yZSBj
b25zaXN0ZW50IHdpdGggb3RoZXIgY29kZS4NCg0KLSBCUiwgQWxla3NlaS4NCg0KLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFh1LCBDb2xpbiANClNlbnQ6IE1vbmRheSwgQXByaWwg
OCwgMjAxOSAxMDowNiBBTQ0KVG86IEdpbWJpdHNraWksIEFsZWtzZWkgPGFsZWtzZWkuZ2ltYml0
c2tpaUBpbnRlbC5jb20+OyBpbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6
IFdhbmcsIFpoaSBBIDx6aGkuYS53YW5nQGludGVsLmNvbT47IFpoZW55dSBXYW5nIDx6aGVueXV3
QGxpbnV4LmludGVsLmNvbT4NClN1YmplY3Q6IFJlOiBbUEFUQ0ggMi81XSBkcm0vaTkxNS9ndnQ6
IERvIG5vdCBjb3B5IHRoZSB1bmluaXRpYWxpemVkIHBvaW50ZXIgZnJvbSBmYl9pbmZvDQoNCg0K
T24gMjAxOS0wNC0wOCAxMzo1NCwgQWxla3NlaSBHaW1iaXRza2lpIHdyb3RlOg0KPiBJbiB0aGUg
Y29kZSB0aGUgbWVtY3B5KCkgZnVuY3Rpb24gY29waWVkIHVuaW5pdGlhbGl6ZWQgcG9pbnRlciBp
biANCj4gZmJfaW5mbyB0byBkbWFidWZfb2JqLT5pbmZvLiBMYXRlciB0aGUgcG9pbnRlciBpbiBk
bWFidWZfb2JqLT5pbmZvIA0KPiB3aWxsIGJlIGluaXRpYWxpemVkLiBUbyBtYWtlIHRoZSBjb2Rl
IGFsaWduZWQgd2l0aCByZXF1aXJlbWVudHMgb2YgdGhlIA0KPiBrbG9jd29yayBzdGF0aWMgY29k
ZSBhbmFseXplciwgdGhlIHVuaW5pdGlhbGl6ZWQgcG9pbnRlciBzaG91bGQgYmUgDQo+IGluaXRp
YWxpemVkIGJlZm9yZSBtZW1jcHkoKS4NCj4NCj4gVGhpcyBwYXRjaCBmaXhlZCB0aGUgY3JpdGlj
YWwgaXNzdWUgIzYzMiByZXBvcnRlZCBieSBrbG9ja3dvcmsuDQo+DQo+IFNpZ25lZC1vZmYtYnk6
IEFsZWtzZWkgR2ltYml0c2tpaSA8YWxla3NlaS5naW1iaXRza2lpQGludGVsLmNvbT4NCj4gQ2M6
IFpoZW55dSBXYW5nIDx6aGVueXV3QGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6IFpoaSBXYW5nIDx6
aGkuYS53YW5nQGludGVsLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0
L2RtYWJ1Zi5jIHwgNCArKy0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2
dC9kbWFidWYuYyANCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZG1hYnVmLmMNCj4gaW5k
ZXggZjZiZTk3MTE5OTY4Li5kODYwNTVjMTQ0YzIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d2dC9kbWFidWYuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
ZG1hYnVmLmMNCj4gQEAgLTQxOCw5ICs0MTgsOSBAQCBpbnQgaW50ZWxfdmdwdV9xdWVyeV9wbGFu
ZShzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwgdm9pZCAqYXJncykNCj4gICAJCXJldCA9IC1FTk9N
RU07DQo+ICAgCQlnb3RvIG91dF9mcmVlX2RtYWJ1ZjsNCj4gICAJfQ0KPiAtCW1lbWNweShkbWFi
dWZfb2JqLT5pbmZvLCAmZmJfaW5mbywgc2l6ZW9mKHN0cnVjdCBpbnRlbF92Z3B1X2ZiX2luZm8p
KTsNCj4gICANCj4gLQkoKHN0cnVjdCBpbnRlbF92Z3B1X2ZiX2luZm8gKilkbWFidWZfb2JqLT5p
bmZvKS0+b2JqID0gZG1hYnVmX29iajsNCj4gKwlmYl9pbmZvLm9iaiA9IGRtYWJ1Zl9vYmo7DQo+
ICsJbWVtY3B5KGRtYWJ1Zl9vYmotPmluZm8sICZmYl9pbmZvLCBzaXplb2Yoc3RydWN0IA0KPiAr
aW50ZWxfdmdwdV9mYl9pbmZvKSk7DQo+ICAgDQoNClNpbmNlIGRtYWJ1Zl9vYmotPmluZm8gaXMg
Y2xvbmVkIGZyb20gZmJfaW5mbywgYW5kIG9iaiBpcyBhc3NpZ25lZCB0aGUgbmV3bHkgYWxsb2Nl
ZCBkbWFidWZfb2JqIGluIHRoaXMgc2FtZSBmdW5jdGlvbiwgcmVnYXJkbGVzcyB3aGF0IGZiX2lu
Zm8tPm9iaiBvcmlnaW5hbCB3YXMsIHdpbGwgaXQgYmUgYmV0dGVyIHRvIGluaXRpYWxpemUgZmJf
aW5mby0+b2JqIGluIHZncHVfZ2V0X3BsYW5lX2luZm8oKSBsaWtlIG90aGVyIG1lbWJlcnM/DQpM
aWtlIGEgc2ltcGxlIHplcm8tb3V0IGZiX2luZm8gYmVmb3JlIGFzc2lnbiBtZW1iZXJzLCBvciBh
biBleHBsaWNpdCBOVUxMIHRvIG9iaj8NCg0KPiAgIAlkbWFidWZfb2JqLT52Z3B1ID0gdmdwdTsN
Cj4gICANCg0KLS0NCkJlc3QgUmVnYXJkcywNCkNvbGluIFh1DQoNCi0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpJbnRl
bCBGaW5sYW5kIE95ClJlZ2lzdGVyZWQgQWRkcmVzczogUEwgMjgxLCAwMDE4MSBIZWxzaW5raSAK
QnVzaW5lc3MgSWRlbnRpdHkgQ29kZTogMDM1NzYwNiAtIDQgCkRvbWljaWxlZCBpbiBIZWxzaW5r
aSAKClRoaXMgZS1tYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgbWF5IGNvbnRhaW4gY29uZmlkZW50
aWFsIG1hdGVyaWFsIGZvcgp0aGUgc29sZSB1c2Ugb2YgdGhlIGludGVuZGVkIHJlY2lwaWVudChz
KS4gQW55IHJldmlldyBvciBkaXN0cmlidXRpb24KYnkgb3RoZXJzIGlzIHN0cmljdGx5IHByb2hp
Yml0ZWQuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZApyZWNpcGllbnQsIHBsZWFzZSBjb250
YWN0IHRoZSBzZW5kZXIgYW5kIGRlbGV0ZSBhbGwgY29waWVzLgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdApp
bnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
