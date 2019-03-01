Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp141071ywe;
        Thu, 28 Feb 2019 19:18:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqyoI9EvXEo7uP68Xn9vgafCYvGe9HY0Jr3Uie9RqnYqkKFHlCnRoS36V+ceVJLg9vfhkAD9
X-Received: by 2002:a17:902:684:: with SMTP id 4mr3060743plh.3.1551410339234;
        Thu, 28 Feb 2019 19:18:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551410339; cv=none;
        d=google.com; s=arc-20160816;
        b=iyULsL4AVdF/ZWsIlz9Fes10gDPFr0ThZnB5tJWO3MUjgmfWM1WrCMCwHt6kG2MYoJ
         cB6Od8KC/zot7SRLxqZrfw3zqRTO6+xIyvZe6ygzftrsFxK0gB/Ow9aYXvhMkXeWTl/x
         r8hj/d570bT0exDVM+JQDhGKoirAoH3DRi47s5MmD88SGqCzwnnOcHILllXPSpSr2TaU
         KJKzo7C/tzkK6LpQsPQZqS06eNlccItIkmcgczaidC2ToB5ey6mtAdmXuvn7aXwpXplK
         yWFVFq1r8g51XfhuhFQBd3OUq2fMSwJiO4bcTVuGPTG+vhjIxsQIIW0uAXM7KCcMC0MP
         PhOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:dlp-reaction:dlp-version:dlp-product
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:to:from:delivered-to;
        bh=tXy+0SvSfx1IIkU/BdMAkFFiFK7fmdlpel/li/r1ppY=;
        b=NeAuEnsdYCrH5tyQgdqO0qs6jEh64INrmsfG/KlyZS09MJxLHjhPdTCVIvTzbOOZUG
         xNx7oSLojYQAMFhimvZIl9VBkHBMWP9ymO0iGI9DmsAhV0anpmW6EihAc1aw0xL7nVkM
         pW2kCFdei17jvopZcxcOiaO2xYjt6XLr+MR5cMUY9uN9b8iKQy2q9enW7XqfjTkSYa16
         zUq9TN84DRnZZIHoZAh3psB1uGFVETYgtlmqvxGiWfw4/YYlp/XHE49yNm7bBS7RP1wd
         zQVl/RBon9Cq5x/EyAWgeBTHlktqJ0AS2C6Y1BZyl4Il9Gyxry8b5HgIAIdB70Np8uS0
         W/tQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id l7si12751108pgp.513.2019.02.28.19.18.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Feb 2019 19:18:59 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75AC66E24F;
	Fri,  1 Mar 2019 03:18:58 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 384C26E24F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  1 Mar 2019 03:18:57 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Feb 2019 19:18:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,425,1544515200"; d="scan'208";a="324381636"
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
 by fmsmga005.fm.intel.com with ESMTP; 28 Feb 2019 19:18:56 -0800
Received: from fmsmsx121.amr.corp.intel.com (10.18.125.36) by
 fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 28 Feb 2019 19:18:56 -0800
Received: from shsmsx102.ccr.corp.intel.com (10.239.4.154) by
 fmsmsx121.amr.corp.intel.com (10.18.125.36) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 28 Feb 2019 19:18:56 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.74]) by
 shsmsx102.ccr.corp.intel.com ([169.254.2.163]) with mapi id 14.03.0415.000;
 Fri, 1 Mar 2019 11:18:54 +0800
From: "Zhang, Xiong Y" <xiong.y.zhang@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Subject: RE: [PATCH 3/3] drm/i915/gvt: Add mutual lock for ppgtt mm LRU list
Thread-Topic: [PATCH 3/3] drm/i915/gvt: Add mutual lock for ppgtt mm LRU list
Thread-Index: AQHUz0vWEjnTf7WwgEOkuh1sno20Z6X2Gjmg
Date: Fri, 1 Mar 2019 03:18:53 +0000
Message-ID: <8082FF9BCB2B054996454E47167FF4EC27543CCF@SHSMSX104.ccr.corp.intel.com>
References: <20190228095542.23356-1-zhenyuw@linux.intel.com>
 <20190228095542.23356-3-zhenyuw@linux.intel.com>
In-Reply-To: <20190228095542.23356-3-zhenyuw@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOTdkYzc2NWItMjU3Zi00ZWViLWIzZWYtNzU1MDhiZmQwMmFkIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiaXNaU1V4NFkzZGpjY0w3Zkk1T09vMFNLRUo0V3dXaXhQXC8rRkl6RHcrMWRDaFROXC9QelVONEVzNjk4cDd6K1lmIn0=
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
Cc: "Zhang, Xiong Y" <xiong.y.zhang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBpbnRlbC1ndnQtZGV2IFttYWls
dG86aW50ZWwtZ3Z0LWRldi1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZ10gT24NCj4gQmVo
YWxmIE9mIFpoZW55dSBXYW5nDQo+IFNlbnQ6IFRodXJzZGF5LCBGZWJydWFyeSAyOCwgMjAxOSA1
OjU2IFBNDQo+IFRvOiBpbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJq
ZWN0OiBbUEFUQ0ggMy8zXSBkcm0vaTkxNS9ndnQ6IEFkZCBtdXR1YWwgbG9jayBmb3IgcHBndHQg
bW0gTFJVIGxpc3QNCj4gDQo+IFRoaXMgYWRkcyBtdXRleCB0byBndWFyZCBhZ2FpbnN0IHVwZGF0
ZSBvZiBnbG9iYWwgcHBndHQgbW0gTFJVIGxpc3QuDQo+IFRvIHJlc29sdmUgZXJyb3IgZm91bmQg
YXMgYmVsb3cgd2FybmluZy4NCj4gDQo+IFs3MzEzMC4wMTIxNjJdIC0tLS0tLS0tLS0tLVsgY3V0
IGhlcmUgXS0tLS0tLS0tLS0tLSBbNzMxMzAuMDEyMTY4XSBsaXN0X2FkZA0KPiBjb3JydXB0aW9u
LiBwcmV2LT5uZXh0IHNob3VsZCBiZSBuZXh0IChmZmZmOTk1Zjk3MGNjYTUwKSwgYnV0IHdhcw0K
PiAwMDAwMDAwMDAwMDAwMDAwLiAocHJldj1mZmZmOTk1ZjBkYzViZGY4KS4NCj4gWzczMTMwLjAx
MjE4MV0gV0FSTklORzogQ1BVOiAzIFBJRDogODIgYXQgbGliL2xpc3RfZGVidWcuYzoyOA0KPiBf
X2xpc3RfYWRkX3ZhbGlkKzB4NGQvMHg3MCBbNzMxMzAuMDEyMTgzXSBNb2R1bGVzIGxpbmtlZCBp
bjogYnRyZnMoRSkgeG9yKEUpDQo+IHpzdGRfZGVjb21wcmVzcyhFKSB6c3RkX2NvbXByZXNzKEUp
IHJhaWQ2X3BxKEUpIGRtX21vZChFKSBrdm1ndChFKQ0KPiBmdXNlKEUpIHh0X2FkZHJ0eXBlKEUp
IG5mdF9jb21wYXQoRSkgeHRfY29ubnRyYWNrKEUpIG5mX25hdChFKQ0KPiBuZl9jb25udHJhY2so
RSkgbmZfZGVmcmFnX2lwdjYoRSkgbmZfZGVmcmFnX2lwdjQoRSkgbGliY3JjMzJjKEUpDQo+IGJy
X25ldGZpbHRlcihFKSBicmlkZ2UoRSkgc3RwKEUpIGxsYyhFKSBvdmVybGF5KEUpIGRldmxpbmso
RSkgbmZfdGFibGVzKEUpDQo+IG5mbmV0bGluayhFKSBsb29wKEUpIHg4Nl9wa2dfdGVtcF90aGVy
bWFsKEUpIGludGVsX3Bvd2VyY2xhbXAoRSkNCj4gY29yZXRlbXAoRSkgY3JjdDEwZGlmX3BjbG11
bChFKSBjcmMzMl9wY2xtdWwoRSkgZ2hhc2hfY2xtdWxuaV9pbnRlbChFKQ0KPiBtZWlfbWUoRSkg
YWVzbmlfaW50ZWwoRSkgYWVzX3g4Nl82NChFKSBjcnlwdG9fc2ltZChFKSBjcnlwdGQoRSkNCj4g
Z2x1ZV9oZWxwZXIoRSkgaW50ZWxfY3N0YXRlKEUpIGludGVsX3VuY29yZShFKSBtZWkoRSkgaW50
ZWxfcGNoX3RoZXJtYWwoRSkNCj4gaW50ZWxfcmFwbF9wZXJmKEUpIHBjc3BrcihFKSBpVENPX3dk
dChFKSBpVENPX3ZlbmRvcl9zdXBwb3J0KEUpIGlkbWE2NChFKQ0KPiBzZyhFKSB2aXJ0X2RtYShF
KSBhY3BpX3BhZChFKSBldmRldihFKSBiaW5mbXRfbWlzYyhFKSBpcF90YWJsZXMoRSkNCj4geF90
YWJsZXMoRSkgaXB2NihFKSBhdXRvZnM0KEUpIGhpZF9nZW5lcmljKEUpIHVzYmhpZChFKSBoaWQo
RSkgZXh0NChFKQ0KPiBjcmMzMmNfZ2VuZXJpYyhFKSBjcmMxNihFKSBtYmNhY2hlKEUpIGpiZDIo
RSkgZnNjcnlwdG8oRSkgeGhjaV9wY2koRSkNCj4gc2RoY2lfcGNpKEUpIGNxaGNpKEUpIGludGVs
X2xwc3NfcGNpKEUpIGludGVsX2xwc3MoRSkgY3JjMzJjX2ludGVsKEUpIHhoY2lfaGNkKEUpDQo+
IHNkaGNpKEUpIGkyY19pODAxKEUpIGUxMDAwZShFKSBtbWNfY29yZShFKSBbNzMxMzAuMDEyMjE4
XSAgcHRwKEUpDQo+IHBwc19jb3JlKEUpIHVzYmNvcmUoRSkgbWZkX2NvcmUoRSkgc2RfbW9kKEUp
IGZhbihFKSB0aGVybWFsKEUpDQo+IFs3MzEzMC4wMTIyMjddIENQVTogMyBQSUQ6IDgyIENvbW06
IGd2dCB3b3JrbG9hZCAwIFRhaW50ZWQ6IEcgICAgICAgIFcNCj4gRSAgICAgNS4wLjAtcmM3LXN0
YWdpbmctMTkwMjI2KyAjMjgyDQo+IFs3MzEzMC4wMTIyMjhdIEhhcmR3YXJlIG5hbWU6ICAvTlVD
Nmk1U1lCLCBCSU9TDQo+IFNZU0tMaTM1Ljg2QS4wMDM5LjIwMTYuMDMxNi4xNzQ3IDAzLzE2LzIw
MTYgWzczMTMwLjAxMjIzMl0gUklQOg0KPiAwMDEwOl9fbGlzdF9hZGRfdmFsaWQrMHg0ZC8weDcw
IFs3MzEzMC4wMTIyMzRdIENvZGU6IGMzIDQ4IDg5IGQxIDQ4IGM3IGM3DQo+IGUwIDgyIDkxIGJi
IDQ4IDg5IGMyIGU4IDQ0IDhhIGNjIGZmIDBmIDBiIDMxIGMwIGMzIDQ4IDg5IGMxIDRjIDg5IGM2
IDQ4IGM3IGM3IDMwDQo+IDgzIDkxIGJiIGU4IDJkIDhhIGNjIGZmIDwwZj4gMGIgMzEgYzAgYzMg
NDggODkgZjIgNGMgODkgYzEgNDggODkgZmUgNDggYzcgYzcgODANCj4gODMgOTEgYmIgZTggWzcz
MTMwLjAxMjIzNl0gUlNQOiAwMDE4OmZmZmZhNDkyNDEwN2ZkZDAgRUZMQUdTOiAwMDAxMDI4Ng0K
PiBbNzMxMzAuMDEyMjM4XSBSQVg6IDAwMDAwMDAwMDAwMDAwMDAgUkJYOiBmZmZmOTk1ZDhhNWNj
ZjAwIFJDWDoNCj4gMDAwMDAwMDAwMDAwMDAwNiBbNzMxMzAuMDEyMjQwXSBSRFg6IDAwMDAwMDAw
MDAwMDAwMDcgUlNJOg0KPiAwMDAwMDAwMDAwMDAwMDg2IFJESTogZmZmZjk5NWZhYWQ5NjY4MCBb
NzMxMzAuMDEyMjQxXSBSQlA6DQo+IDAwMDAwMDAwMDAwMDAwMDAgUjA4OiAwMDAwMDAwMDAwMjEz
YTI4IFIwOTogMDAwMDAwMDAwMDAwMDA4NA0KPiBbNzMxMzAuMDEyMjQzXSBSMTA6IDAwMDAwMDAw
MDAwMDAwMDAgUjExOiBmZmZmYTQ5MjQxMDdmYzcwIFIxMjoNCj4gZmZmZjk5NWQ4YTVjY2Y3OCBb
NzMxMzAuMDEyMjQ1XSBSMTM6IGZmZmY5OTVmOTcwYzgwMDAgUjE0Og0KPiBmZmZmOTk1ZjBkYzVi
ZGY4IFIxNTogZmZmZjk5NWY5NzBjY2E1MCBbNzMxMzAuMDEyMjQ3XSBGUzoNCj4gMDAwMDAwMDAw
MDAwMDAwMCgwMDAwKSBHUzpmZmZmOTk1ZmFhZDgwMDAwKDAwMDApDQo+IGtubEdTOjAwMDAwMDAw
MDAwMDAwMDAgWzczMTMwLjAxMjI0OV0gQ1M6ICAwMDEwIERTOiAwMDAwIEVTOiAwMDAwIENSMDoN
Cj4gMDAwMDAwMDA4MDA1MDAzMyBbNzMxMzAuMDEyMjUwXSBDUjI6IDAwMDAwMjIyZTE4OTEwMDAg
Q1IzOg0KPiAwMDAwMDAwMTE2ODQ4MDAyIENSNDogMDAwMDAwMDAwMDM2MjZlMCBbNzMxMzAuMDEy
MjUyXSBDYWxsIFRyYWNlOg0KPiBbNzMxMzAuMDEyMjU4XSAgaW50ZWxfdmdwdV9waW5fbW0rMHg3
YS8weGEwIFs3MzEzMC4wMTIyNjJdDQo+IHdvcmtsb2FkX3RocmVhZCsweDY4My8weDEyYTAgWzcz
MTMwLjAxMjI2Nl0gID8NCj4gZG9fd2FpdF9pbnRyX2lycSsweGIwLzB4YjAgWzczMTMwLjAxMjI2
OV0gID8gZmluaXNoX3dhaXQrMHg4MC8weDgwDQo+IFs3MzEzMC4wMTIyNzFdICA/IGludGVsX3Zn
cHVfY2xlYW5fd29ya2xvYWRzKzB4MTEwLzB4MTEwDQo+IFs3MzEzMC4wMTIyNzRdICBrdGhyZWFk
KzB4MTE2LzB4MTMwDQo+IFs3MzEzMC4wMTIyNzZdICA/IGt0aHJlYWRfYmluZCsweDMwLzB4MzAg
WzczMTMwLjAxMjI4MF0NCj4gcmV0X2Zyb21fZm9yaysweDM1LzB4NDAgWzczMTMwLjAxMjI4NV0g
V0FSTklORzogQ1BVOiAzIFBJRDogODIgYXQNCj4gbGliL2xpc3RfZGVidWcuYzoyOCBfX2xpc3Rf
YWRkX3ZhbGlkKzB4NGQvMHg3MCBbNzMxMzAuMDEyMjg2XSAtLS1bIGVuZCB0cmFjZQ0KPiA0NThh
MmU3OTJlZWMyMWMwIF0tLS0NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFpoZW55dSBXYW5nIDx6aGVu
eXV3QGxpbnV4LmludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
Z3R0LmMgfCAyMiArKysrKysrKysrKysrKysrKystLS0tDQo+IGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC9ndHQuaCB8ICAxICsNCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwg
NCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dnQvZ3R0LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMNCj4gaW5kZXggOWJhMWVk
ODE3NmUyLi4wYWRhNTYzY2E1N2EgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC9ndHQuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMNCj4gQEAg
LTE4ODIsNyArMTg4MiwxMSBAQCBzdHJ1Y3QgaW50ZWxfdmdwdV9tbQ0KPiAqaW50ZWxfdmdwdV9j
cmVhdGVfcHBndHRfbW0oc3RydWN0IGludGVsX3ZncHUgKnZncHUsDQo+ICAJfQ0KPiANCj4gIAls
aXN0X2FkZF90YWlsKCZtbS0+cHBndHRfbW0ubGlzdCwgJnZncHUtPmd0dC5wcGd0dF9tbV9saXN0
X2hlYWQpOw0KPiArDQo+ICsJbXV0ZXhfbG9jaygmZ3Z0LT5ndHQucHBndHRfbW1fbG9jayk7DQo+
ICAJbGlzdF9hZGRfdGFpbCgmbW0tPnBwZ3R0X21tLmxydV9saXN0LA0KPiAmZ3Z0LT5ndHQucHBn
dHRfbW1fbHJ1X2xpc3RfaGVhZCk7DQo+ICsJbXV0ZXhfdW5sb2NrKCZndnQtPmd0dC5wcGd0dF9t
bV9sb2NrKTsNCj4gKw0KPiAgCXJldHVybiBtbTsNCj4gIH0NCj4gDQo+IEBAIC0xOTY3LDkgKzE5
NzEsMTAgQEAgaW50IGludGVsX3ZncHVfcGluX21tKHN0cnVjdCBpbnRlbF92Z3B1X21tDQo+ICpt
bSkNCj4gIAkJaWYgKHJldCkNCj4gIAkJCXJldHVybiByZXQ7DQo+IA0KPiArCQltdXRleF9sb2Nr
KCZtbS0+dmdwdS0+Z3Z0LT5ndHQucHBndHRfbW1fbG9jayk7DQo+ICAJCWxpc3RfbW92ZV90YWls
KCZtbS0+cHBndHRfbW0ubHJ1X2xpc3QsDQo+ICAJCQkgICAgICAgJm1tLT52Z3B1LT5ndnQtPmd0
dC5wcGd0dF9tbV9scnVfbGlzdF9oZWFkKTsNCj4gLQ0KPiArCQltdXRleF91bmxvY2soJm1tLT52
Z3B1LT5ndnQtPmd0dC5wcGd0dF9tbV9sb2NrKTsNCj4gIAl9DQo+IA0KPiAgCXJldHVybiAwOw0K
PiBAQCAtMTk4MCwxNyArMTk4NSwyMyBAQCBzdGF0aWMgaW50IHJlY2xhaW1fb25lX3BwZ3R0X21t
KHN0cnVjdA0KPiBpbnRlbF9ndnQgKmd2dCkNCj4gIAlzdHJ1Y3QgaW50ZWxfdmdwdV9tbSAqbW07
DQo+ICAJc3RydWN0IGxpc3RfaGVhZCAqcG9zLCAqbjsNCj4gDQo+ICsJbXV0ZXhfbG9jaygmZ3Z0
LT5ndHQucHBndHRfbW1fbG9jayk7DQo+ICsNCj4gIAlsaXN0X2Zvcl9lYWNoX3NhZmUocG9zLCBu
LCAmZ3Z0LT5ndHQucHBndHRfbW1fbHJ1X2xpc3RfaGVhZCkgew0KPiAgCQltbSA9IGNvbnRhaW5l
cl9vZihwb3MsIHN0cnVjdCBpbnRlbF92Z3B1X21tLCBwcGd0dF9tbS5scnVfbGlzdCk7DQo+IA0K
PiAgCQlpZiAoYXRvbWljX3JlYWQoJm1tLT5waW5jb3VudCkpDQo+ICAJCQljb250aW51ZTsNCj4g
DQo+IC0JCWxpc3RfZGVsX2luaXQoJm1tLT5wcGd0dF9tbS5scnVfbGlzdCk7DQo+IC0JCWludmFs
aWRhdGVfcHBndHRfbW0obW0pOw0KPiAtCQlyZXR1cm4gMTsNCj4gKwkJZ290byBmb3VuZDsNCj4g
IAl9DQo+ICsJbXV0ZXhfdW5sb2NrKCZndnQtPmd0dC5wcGd0dF9tbV9sb2NrKTsNCj4gIAlyZXR1
cm4gMDsNCj4gK2ZvdW5kOg0KPiArCWxpc3RfZGVsX2luaXQoJm1tLT5wcGd0dF9tbS5scnVfbGlz
dCk7DQo+ICsJbXV0ZXhfdW5sb2NrKCZndnQtPmd0dC5wcGd0dF9tbV9sb2NrKTsNCj4gKwlpbnZh
bGlkYXRlX3BwZ3R0X21tKG1tKTsNCj4gKwlyZXR1cm4gMTsNCj4gIH0NCltaaGFuZywgWGlvbmcg
WV0gaG93IGFib3V0IGRlbGV0ZSBnb3RvID8gbW92ZSB0aGlzIGNvZGUgdG8gZ290bw0KPiArCWxp
c3RfZGVsX2luaXQoJm1tLT5wcGd0dF9tbS5scnVfbGlzdCk7DQo+ICsJbXV0ZXhfdW5sb2NrKCZn
dnQtPmd0dC5wcGd0dF9tbV9sb2NrKTsNCj4gKwlpbnZhbGlkYXRlX3BwZ3R0X21tKG1tKTsNCj4g
KwlyZXR1cm4gMTsNCnRoYW5rcw0KPiANCj4gIC8qDQo+IEBAIC0yNjY2LDYgKzI2NzcsNyBAQCBp
bnQgaW50ZWxfZ3Z0X2luaXRfZ3R0KHN0cnVjdCBpbnRlbF9ndnQgKmd2dCkNCj4gIAkJfQ0KPiAg
CX0NCj4gIAlJTklUX0xJU1RfSEVBRCgmZ3Z0LT5ndHQucHBndHRfbW1fbHJ1X2xpc3RfaGVhZCk7
DQo+ICsJbXV0ZXhfaW5pdCgmZ3Z0LT5ndHQucHBndHRfbW1fbG9jayk7DQo+ICAJcmV0dXJuIDA7
DQo+ICB9DQo+IA0KPiBAQCAtMjcwNiw3ICsyNzE4LDkgQEAgdm9pZCBpbnRlbF92Z3B1X2ludmFs
aWRhdGVfcHBndHQoc3RydWN0IGludGVsX3ZncHUNCj4gKnZncHUpDQo+ICAJbGlzdF9mb3JfZWFj
aF9zYWZlKHBvcywgbiwgJnZncHUtPmd0dC5wcGd0dF9tbV9saXN0X2hlYWQpIHsNCj4gIAkJbW0g
PSBjb250YWluZXJfb2YocG9zLCBzdHJ1Y3QgaW50ZWxfdmdwdV9tbSwgcHBndHRfbW0ubGlzdCk7
DQo+ICAJCWlmIChtbS0+dHlwZSA9PSBJTlRFTF9HVlRfTU1fUFBHVFQpIHsNCj4gKwkJCW11dGV4
X2xvY2soJnZncHUtPmd2dC0+Z3R0LnBwZ3R0X21tX2xvY2spOw0KPiAgCQkJbGlzdF9kZWxfaW5p
dCgmbW0tPnBwZ3R0X21tLmxydV9saXN0KTsNCj4gKwkJCW11dGV4X3VubG9jaygmdmdwdS0+Z3Z0
LT5ndHQucHBndHRfbW1fbG9jayk7DQo+ICAJCQlpZiAobW0tPnBwZ3R0X21tLnNoYWRvd2VkKQ0K
PiAgCQkJCWludmFsaWRhdGVfcHBndHRfbW0obW0pOw0KPiAgCQl9DQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmggYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
Z3R0LmgNCj4gaW5kZXggZTlmNzJhNjU5MDE0Li4zMmM1NzNhZWE0OTQgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndnQvZ3R0LmgNCj4gQEAgLTg4LDYgKzg4LDcgQEAgc3RydWN0IGludGVsX2d2dF9ndHQg
ew0KPiAgCXZvaWQgKCptbV9mcmVlX3BhZ2VfdGFibGUpKHN0cnVjdCBpbnRlbF92Z3B1X21tICpt
bSk7DQo+ICAJc3RydWN0IGxpc3RfaGVhZCBvb3NfcGFnZV91c2VfbGlzdF9oZWFkOw0KPiAgCXN0
cnVjdCBsaXN0X2hlYWQgb29zX3BhZ2VfZnJlZV9saXN0X2hlYWQ7DQo+ICsJc3RydWN0IG11dGV4
IHBwZ3R0X21tX2xvY2s7DQo+ICAJc3RydWN0IGxpc3RfaGVhZCBwcGd0dF9tbV9scnVfbGlzdF9o
ZWFkOw0KPiANCj4gIAlzdHJ1Y3QgcGFnZSAqc2NyYXRjaF9wYWdlOw0KPiAtLQ0KPiAyLjIwLjEN
Cj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+
IGludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0DQo+IGludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vaW50ZWwtZ3Z0LWRldg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9pbnRlbC1ndnQtZGV2
