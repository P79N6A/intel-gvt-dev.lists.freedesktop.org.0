Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp400684ywe;
        Fri, 1 Mar 2019 01:44:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqyPACa0/bb+F1PdCRXYyeG7f4H7nkQNP0OzT9RkjWafvmONvFyvd4DiVQvcKqhBWSNS/7eV
X-Received: by 2002:a17:902:b708:: with SMTP id d8mr4433491pls.322.1551433479674;
        Fri, 01 Mar 2019 01:44:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551433479; cv=none;
        d=google.com; s=arc-20160816;
        b=mjpowKugyRoVuGjkn7rmtMfrwVDW4sEirjlqsS08JQ92tDCmmXXvpMA3sMM5MAjVCy
         WaMxkueP4DMn0IhPf9eUSNqqpcbjzPlSWynjMYdSUG0YzyPX8MuPZXKZNN0B2XlyIMLh
         TduJtnSsUmxfbnmXU3VbGAPWHw3T3NYMG8MMzWonOwhjuAG1+ZGNY5OTz1Mvhoif40oB
         kM2HSBMTPlifA3gZ0f9Ua8DCyIqu74GvjpyAqM0OoNvuAJHUfdM1jl1lkd4OvfqpkACk
         MpcTZDrcYuBqNopfyCcOyciQmZAnrvDcTxpHdytjxW2m9PN7NQgTvehqgTk85wD2nwsd
         qLhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:dlp-reaction:dlp-version:dlp-product
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:to:from:delivered-to;
        bh=fAz32ynvIEKU4oTm0LLqkb0RHJEB3qYDLxiW+BCA6KU=;
        b=TTYBGseMbdHCsZ2XJE2k8Dfdfq9oVIpigm1PrQP5TUAzSLrXYQKPC7KUiTiEdtop+i
         cvunfbu8Lrm+aL3Cqnkk5BSiyjoiaBxRDBw3x43la7wcvTO5AXFXeyYLFACK94WpEavD
         zfngZOaSQWOYia91gZ2PVRsTJmGV4/pJu5y9Y5gu6lxZiqqNVAqrMoste4AuIvjpbkcb
         33FKNK+PaX2d/0WG7ymaahIGSKDzsgRU/kZx2PfzGtZJyOcdxAsfneRRF8U2rzl5+n0y
         SWpf/50eyaGcg2UCtBViKe1FWeGwz60QbixhWPeKDKrfVhDvB017NJciXkDhYo7op1u3
         /J2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id k18si20106291pfj.46.2019.03.01.01.44.39
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Mar 2019 01:44:39 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 440C76E2A0;
	Fri,  1 Mar 2019 09:44:39 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D274F6E2A0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  1 Mar 2019 09:44:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Mar 2019 01:44:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,427,1544515200"; d="scan'208";a="147614160"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by fmsmga002.fm.intel.com with ESMTP; 01 Mar 2019 01:44:36 -0800
Received: from fmsmsx155.amr.corp.intel.com (10.18.116.71) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Fri, 1 Mar 2019 01:44:36 -0800
Received: from shsmsx101.ccr.corp.intel.com (10.239.4.153) by
 FMSMSX155.amr.corp.intel.com (10.18.116.71) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Fri, 1 Mar 2019 01:44:33 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.74]) by
 SHSMSX101.ccr.corp.intel.com ([169.254.1.158]) with mapi id 14.03.0415.000;
 Fri, 1 Mar 2019 17:42:51 +0800
From: "Zhang, Xiong Y" <xiong.y.zhang@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Subject: RE: [PATCH v2 3/3] drm/i915/gvt: Add mutual lock for ppgtt mm LRU list
Thread-Topic: [PATCH v2 3/3] drm/i915/gvt: Add mutual lock for ppgtt mm LRU
 list
Thread-Index: AQHUz/0SJoIPAZKHe0OXAVTFNDWx1KX2hjlQ
Date: Fri, 1 Mar 2019 09:42:50 +0000
Message-ID: <8082FF9BCB2B054996454E47167FF4EC275440E8@SHSMSX104.ccr.corp.intel.com>
References: <20190228095542.23356-1-zhenyuw@linux.intel.com>
 <20190301070413.6036-3-zhenyuw@linux.intel.com>
In-Reply-To: <20190301070413.6036-3-zhenyuw@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOWQ0ZDc1OTItMmU1Mi00YmZmLTljZTUtNzliZTQyODU3NzhkIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiNE1VWDhKNFwvVWhxSEZaSlo0Q3ZYYVM0Mmd1Q0kxa3IySFBOSk5QZ05cL05VSWl5VE1nUU9BR2w1XC8waUMwT2F6cCJ9
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

UmV2aWV3ZWQtYnk6IFhpb25nIFpoYW5nIDx4aW9uZy55LnpoYW5nQGludGVsLmNvbT4NCg0KdGhh
bmtzDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGludGVsLWd2dC1kZXYg
W21haWx0bzppbnRlbC1ndnQtZGV2LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnXSBPbg0K
PiBCZWhhbGYgT2YgWmhlbnl1IFdhbmcNCj4gU2VudDogRnJpZGF5LCBNYXJjaCAxLCAyMDE5IDM6
MDQgUE0NCj4gVG86IGludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBa
aGFuZywgWGlvbmcgWSA8eGlvbmcueS56aGFuZ0BpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRD
SCB2MiAzLzNdIGRybS9pOTE1L2d2dDogQWRkIG11dHVhbCBsb2NrIGZvciBwcGd0dCBtbSBMUlUg
bGlzdA0KPiANCj4gVGhpcyBhZGRzIG11dGV4IHRvIGd1YXJkIGFnYWluc3QgdXBkYXRlIG9mIGds
b2JhbCBwcGd0dCBtbSBMUlUgbGlzdC4NCj4gVG8gcmVzb2x2ZSBlcnJvciBmb3VuZCBhcyBiZWxv
dyB3YXJuaW5nLg0KPiANCj4gWzczMTMwLjAxMjE2Ml0gLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBd
LS0tLS0tLS0tLS0tIFs3MzEzMC4wMTIxNjhdIGxpc3RfYWRkDQo+IGNvcnJ1cHRpb24uIHByZXYt
Pm5leHQgc2hvdWxkIGJlIG5leHQgKGZmZmY5OTVmOTcwY2NhNTApLCBidXQgd2FzDQo+IDAwMDAw
MDAwMDAwMDAwMDAuIChwcmV2PWZmZmY5OTVmMGRjNWJkZjgpLg0KPiBbNzMxMzAuMDEyMTgxXSBX
QVJOSU5HOiBDUFU6IDMgUElEOiA4MiBhdCBsaWIvbGlzdF9kZWJ1Zy5jOjI4DQo+IF9fbGlzdF9h
ZGRfdmFsaWQrMHg0ZC8weDcwIFs3MzEzMC4wMTIxODNdIE1vZHVsZXMgbGlua2VkIGluOiBidHJm
cyhFKSB4b3IoRSkNCj4genN0ZF9kZWNvbXByZXNzKEUpIHpzdGRfY29tcHJlc3MoRSkgcmFpZDZf
cHEoRSkgZG1fbW9kKEUpIGt2bWd0KEUpDQo+IGZ1c2UoRSkgeHRfYWRkcnR5cGUoRSkgbmZ0X2Nv
bXBhdChFKSB4dF9jb25udHJhY2soRSkgbmZfbmF0KEUpDQo+IG5mX2Nvbm50cmFjayhFKSBuZl9k
ZWZyYWdfaXB2NihFKSBuZl9kZWZyYWdfaXB2NChFKSBsaWJjcmMzMmMoRSkNCj4gYnJfbmV0Zmls
dGVyKEUpIGJyaWRnZShFKSBzdHAoRSkgbGxjKEUpIG92ZXJsYXkoRSkgZGV2bGluayhFKSBuZl90
YWJsZXMoRSkNCj4gbmZuZXRsaW5rKEUpIGxvb3AoRSkgeDg2X3BrZ190ZW1wX3RoZXJtYWwoRSkg
aW50ZWxfcG93ZXJjbGFtcChFKQ0KPiBjb3JldGVtcChFKSBjcmN0MTBkaWZfcGNsbXVsKEUpIGNy
YzMyX3BjbG11bChFKSBnaGFzaF9jbG11bG5pX2ludGVsKEUpDQo+IG1laV9tZShFKSBhZXNuaV9p
bnRlbChFKSBhZXNfeDg2XzY0KEUpIGNyeXB0b19zaW1kKEUpIGNyeXB0ZChFKQ0KPiBnbHVlX2hl
bHBlcihFKSBpbnRlbF9jc3RhdGUoRSkgaW50ZWxfdW5jb3JlKEUpIG1laShFKSBpbnRlbF9wY2hf
dGhlcm1hbChFKQ0KPiBpbnRlbF9yYXBsX3BlcmYoRSkgcGNzcGtyKEUpIGlUQ09fd2R0KEUpIGlU
Q09fdmVuZG9yX3N1cHBvcnQoRSkgaWRtYTY0KEUpDQo+IHNnKEUpIHZpcnRfZG1hKEUpIGFjcGlf
cGFkKEUpIGV2ZGV2KEUpIGJpbmZtdF9taXNjKEUpIGlwX3RhYmxlcyhFKQ0KPiB4X3RhYmxlcyhF
KSBpcHY2KEUpIGF1dG9mczQoRSkgaGlkX2dlbmVyaWMoRSkgdXNiaGlkKEUpIGhpZChFKSBleHQ0
KEUpDQo+IGNyYzMyY19nZW5lcmljKEUpIGNyYzE2KEUpIG1iY2FjaGUoRSkgamJkMihFKSBmc2Ny
eXB0byhFKSB4aGNpX3BjaShFKQ0KPiBzZGhjaV9wY2koRSkgY3FoY2koRSkgaW50ZWxfbHBzc19w
Y2koRSkgaW50ZWxfbHBzcyhFKSBjcmMzMmNfaW50ZWwoRSkgeGhjaV9oY2QoRSkNCj4gc2RoY2ko
RSkgaTJjX2k4MDEoRSkgZTEwMDBlKEUpIG1tY19jb3JlKEUpIFs3MzEzMC4wMTIyMThdICBwdHAo
RSkNCj4gcHBzX2NvcmUoRSkgdXNiY29yZShFKSBtZmRfY29yZShFKSBzZF9tb2QoRSkgZmFuKEUp
IHRoZXJtYWwoRSkNCj4gWzczMTMwLjAxMjIyN10gQ1BVOiAzIFBJRDogODIgQ29tbTogZ3Z0IHdv
cmtsb2FkIDAgVGFpbnRlZDogRyAgICAgICAgVw0KPiBFICAgICA1LjAuMC1yYzctc3RhZ2luZy0x
OTAyMjYrICMyODINCj4gWzczMTMwLjAxMjIyOF0gSGFyZHdhcmUgbmFtZTogIC9OVUM2aTVTWUIs
IEJJT1MNCj4gU1lTS0xpMzUuODZBLjAwMzkuMjAxNi4wMzE2LjE3NDcgMDMvMTYvMjAxNiBbNzMx
MzAuMDEyMjMyXSBSSVA6DQo+IDAwMTA6X19saXN0X2FkZF92YWxpZCsweDRkLzB4NzAgWzczMTMw
LjAxMjIzNF0gQ29kZTogYzMgNDggODkgZDEgNDggYzcgYzcNCj4gZTAgODIgOTEgYmIgNDggODkg
YzIgZTggNDQgOGEgY2MgZmYgMGYgMGIgMzEgYzAgYzMgNDggODkgYzEgNGMgODkgYzYgNDggYzcg
YzcgMzANCj4gODMgOTEgYmIgZTggMmQgOGEgY2MgZmYgPDBmPiAwYiAzMSBjMCBjMyA0OCA4OSBm
MiA0YyA4OSBjMSA0OCA4OSBmZSA0OCBjNyBjNyA4MA0KPiA4MyA5MSBiYiBlOCBbNzMxMzAuMDEy
MjM2XSBSU1A6IDAwMTg6ZmZmZmE0OTI0MTA3ZmRkMCBFRkxBR1M6IDAwMDEwMjg2DQo+IFs3MzEz
MC4wMTIyMzhdIFJBWDogMDAwMDAwMDAwMDAwMDAwMCBSQlg6IGZmZmY5OTVkOGE1Y2NmMDAgUkNY
Og0KPiAwMDAwMDAwMDAwMDAwMDA2IFs3MzEzMC4wMTIyNDBdIFJEWDogMDAwMDAwMDAwMDAwMDAw
NyBSU0k6DQo+IDAwMDAwMDAwMDAwMDAwODYgUkRJOiBmZmZmOTk1ZmFhZDk2NjgwIFs3MzEzMC4w
MTIyNDFdIFJCUDoNCj4gMDAwMDAwMDAwMDAwMDAwMCBSMDg6IDAwMDAwMDAwMDAyMTNhMjggUjA5
OiAwMDAwMDAwMDAwMDAwMDg0DQo+IFs3MzEzMC4wMTIyNDNdIFIxMDogMDAwMDAwMDAwMDAwMDAw
MCBSMTE6IGZmZmZhNDkyNDEwN2ZjNzAgUjEyOg0KPiBmZmZmOTk1ZDhhNWNjZjc4IFs3MzEzMC4w
MTIyNDVdIFIxMzogZmZmZjk5NWY5NzBjODAwMCBSMTQ6DQo+IGZmZmY5OTVmMGRjNWJkZjggUjE1
OiBmZmZmOTk1Zjk3MGNjYTUwIFs3MzEzMC4wMTIyNDddIEZTOg0KPiAwMDAwMDAwMDAwMDAwMDAw
KDAwMDApIEdTOmZmZmY5OTVmYWFkODAwMDAoMDAwMCkNCj4ga25sR1M6MDAwMDAwMDAwMDAwMDAw
MCBbNzMxMzAuMDEyMjQ5XSBDUzogIDAwMTAgRFM6IDAwMDAgRVM6IDAwMDAgQ1IwOg0KPiAwMDAw
MDAwMDgwMDUwMDMzIFs3MzEzMC4wMTIyNTBdIENSMjogMDAwMDAyMjJlMTg5MTAwMCBDUjM6DQo+
IDAwMDAwMDAxMTY4NDgwMDIgQ1I0OiAwMDAwMDAwMDAwMzYyNmUwIFs3MzEzMC4wMTIyNTJdIENh
bGwgVHJhY2U6DQo+IFs3MzEzMC4wMTIyNThdICBpbnRlbF92Z3B1X3Bpbl9tbSsweDdhLzB4YTAg
WzczMTMwLjAxMjI2Ml0NCj4gd29ya2xvYWRfdGhyZWFkKzB4NjgzLzB4MTJhMCBbNzMxMzAuMDEy
MjY2XSAgPw0KPiBkb193YWl0X2ludHJfaXJxKzB4YjAvMHhiMCBbNzMxMzAuMDEyMjY5XSAgPyBm
aW5pc2hfd2FpdCsweDgwLzB4ODANCj4gWzczMTMwLjAxMjI3MV0gID8gaW50ZWxfdmdwdV9jbGVh
bl93b3JrbG9hZHMrMHgxMTAvMHgxMTANCj4gWzczMTMwLjAxMjI3NF0gIGt0aHJlYWQrMHgxMTYv
MHgxMzANCj4gWzczMTMwLjAxMjI3Nl0gID8ga3RocmVhZF9iaW5kKzB4MzAvMHgzMCBbNzMxMzAu
MDEyMjgwXQ0KPiByZXRfZnJvbV9mb3JrKzB4MzUvMHg0MCBbNzMxMzAuMDEyMjg1XSBXQVJOSU5H
OiBDUFU6IDMgUElEOiA4MiBhdA0KPiBsaWIvbGlzdF9kZWJ1Zy5jOjI4IF9fbGlzdF9hZGRfdmFs
aWQrMHg0ZC8weDcwIFs3MzEzMC4wMTIyODZdIC0tLVsgZW5kIHRyYWNlDQo+IDQ1OGEyZTc5MmVl
YzIxYzAgXS0tLQ0KPiANCj4gdjI6DQo+IC0gc2ltcGxpZnkgbG9jayBoYW5kbGluZw0KPiANCj4g
Q2M6IFhpb25nIFpoYW5nIDx4aW9uZy55LnpoYW5nQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1i
eTogWmhlbnl1IFdhbmcgPHpoZW55dXdAbGludXguaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYyB8IDE0ICsrKysrKysrKysrKystDQo+IGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC9ndHQuaCB8ICAxICsNCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTQgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d2dC9ndHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYw0KPiBp
bmRleCA5YmExZWQ4MTc2ZTIuLmY0Yzk5MmQ5NjA4NyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3Z0L2d0dC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9n
dHQuYw0KPiBAQCAtMTg4Miw3ICsxODgyLDExIEBAIHN0cnVjdCBpbnRlbF92Z3B1X21tDQo+ICpp
bnRlbF92Z3B1X2NyZWF0ZV9wcGd0dF9tbShzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwNCj4gIAl9
DQo+IA0KPiAgCWxpc3RfYWRkX3RhaWwoJm1tLT5wcGd0dF9tbS5saXN0LCAmdmdwdS0+Z3R0LnBw
Z3R0X21tX2xpc3RfaGVhZCk7DQo+ICsNCj4gKwltdXRleF9sb2NrKCZndnQtPmd0dC5wcGd0dF9t
bV9sb2NrKTsNCj4gIAlsaXN0X2FkZF90YWlsKCZtbS0+cHBndHRfbW0ubHJ1X2xpc3QsDQo+ICZn
dnQtPmd0dC5wcGd0dF9tbV9scnVfbGlzdF9oZWFkKTsNCj4gKwltdXRleF91bmxvY2soJmd2dC0+
Z3R0LnBwZ3R0X21tX2xvY2spOw0KPiArDQo+ICAJcmV0dXJuIG1tOw0KPiAgfQ0KPiANCj4gQEAg
LTE5NjcsOSArMTk3MSwxMCBAQCBpbnQgaW50ZWxfdmdwdV9waW5fbW0oc3RydWN0IGludGVsX3Zn
cHVfbW0NCj4gKm1tKQ0KPiAgCQlpZiAocmV0KQ0KPiAgCQkJcmV0dXJuIHJldDsNCj4gDQo+ICsJ
CW11dGV4X2xvY2soJm1tLT52Z3B1LT5ndnQtPmd0dC5wcGd0dF9tbV9sb2NrKTsNCj4gIAkJbGlz
dF9tb3ZlX3RhaWwoJm1tLT5wcGd0dF9tbS5scnVfbGlzdCwNCj4gIAkJCSAgICAgICAmbW0tPnZn
cHUtPmd2dC0+Z3R0LnBwZ3R0X21tX2xydV9saXN0X2hlYWQpOw0KPiAtDQo+ICsJCW11dGV4X3Vu
bG9jaygmbW0tPnZncHUtPmd2dC0+Z3R0LnBwZ3R0X21tX2xvY2spOw0KPiAgCX0NCj4gDQo+ICAJ
cmV0dXJuIDA7DQo+IEBAIC0xOTgwLDYgKzE5ODUsOCBAQCBzdGF0aWMgaW50IHJlY2xhaW1fb25l
X3BwZ3R0X21tKHN0cnVjdCBpbnRlbF9ndnQNCj4gKmd2dCkNCj4gIAlzdHJ1Y3QgaW50ZWxfdmdw
dV9tbSAqbW07DQo+ICAJc3RydWN0IGxpc3RfaGVhZCAqcG9zLCAqbjsNCj4gDQo+ICsJbXV0ZXhf
bG9jaygmZ3Z0LT5ndHQucHBndHRfbW1fbG9jayk7DQo+ICsNCj4gIAlsaXN0X2Zvcl9lYWNoX3Nh
ZmUocG9zLCBuLCAmZ3Z0LT5ndHQucHBndHRfbW1fbHJ1X2xpc3RfaGVhZCkgew0KPiAgCQltbSA9
IGNvbnRhaW5lcl9vZihwb3MsIHN0cnVjdCBpbnRlbF92Z3B1X21tLCBwcGd0dF9tbS5scnVfbGlz
dCk7DQo+IA0KPiBAQCAtMTk4Nyw5ICsxOTk0LDExIEBAIHN0YXRpYyBpbnQgcmVjbGFpbV9vbmVf
cHBndHRfbW0oc3RydWN0IGludGVsX2d2dA0KPiAqZ3Z0KQ0KPiAgCQkJY29udGludWU7DQo+IA0K
PiAgCQlsaXN0X2RlbF9pbml0KCZtbS0+cHBndHRfbW0ubHJ1X2xpc3QpOw0KPiArCQltdXRleF91
bmxvY2soJmd2dC0+Z3R0LnBwZ3R0X21tX2xvY2spOw0KPiAgCQlpbnZhbGlkYXRlX3BwZ3R0X21t
KG1tKTsNCj4gIAkJcmV0dXJuIDE7DQo+ICAJfQ0KPiArCW11dGV4X3VubG9jaygmZ3Z0LT5ndHQu
cHBndHRfbW1fbG9jayk7DQo+ICAJcmV0dXJuIDA7DQo+ICB9DQo+IA0KPiBAQCAtMjY2Niw2ICsy
Njc1LDcgQEAgaW50IGludGVsX2d2dF9pbml0X2d0dChzdHJ1Y3QgaW50ZWxfZ3Z0ICpndnQpDQo+
ICAJCX0NCj4gIAl9DQo+ICAJSU5JVF9MSVNUX0hFQUQoJmd2dC0+Z3R0LnBwZ3R0X21tX2xydV9s
aXN0X2hlYWQpOw0KPiArCW11dGV4X2luaXQoJmd2dC0+Z3R0LnBwZ3R0X21tX2xvY2spOw0KPiAg
CXJldHVybiAwOw0KPiAgfQ0KPiANCj4gQEAgLTI3MDYsNyArMjcxNiw5IEBAIHZvaWQgaW50ZWxf
dmdwdV9pbnZhbGlkYXRlX3BwZ3R0KHN0cnVjdCBpbnRlbF92Z3B1DQo+ICp2Z3B1KQ0KPiAgCWxp
c3RfZm9yX2VhY2hfc2FmZShwb3MsIG4sICZ2Z3B1LT5ndHQucHBndHRfbW1fbGlzdF9oZWFkKSB7
DQo+ICAJCW1tID0gY29udGFpbmVyX29mKHBvcywgc3RydWN0IGludGVsX3ZncHVfbW0sIHBwZ3R0
X21tLmxpc3QpOw0KPiAgCQlpZiAobW0tPnR5cGUgPT0gSU5URUxfR1ZUX01NX1BQR1RUKSB7DQo+
ICsJCQltdXRleF9sb2NrKCZ2Z3B1LT5ndnQtPmd0dC5wcGd0dF9tbV9sb2NrKTsNCj4gIAkJCWxp
c3RfZGVsX2luaXQoJm1tLT5wcGd0dF9tbS5scnVfbGlzdCk7DQo+ICsJCQltdXRleF91bmxvY2so
JnZncHUtPmd2dC0+Z3R0LnBwZ3R0X21tX2xvY2spOw0KPiAgCQkJaWYgKG1tLT5wcGd0dF9tbS5z
aGFkb3dlZCkNCj4gIAkJCQlpbnZhbGlkYXRlX3BwZ3R0X21tKG1tKTsNCj4gIAkJfQ0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5oIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Z0L2d0dC5oDQo+IGluZGV4IGU5ZjcyYTY1OTAxNC4uMzJjNTczYWVhNDk0IDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmgNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5oDQo+IEBAIC04OCw2ICs4OCw3IEBAIHN0cnVjdCBpbnRl
bF9ndnRfZ3R0IHsNCj4gIAl2b2lkICgqbW1fZnJlZV9wYWdlX3RhYmxlKShzdHJ1Y3QgaW50ZWxf
dmdwdV9tbSAqbW0pOw0KPiAgCXN0cnVjdCBsaXN0X2hlYWQgb29zX3BhZ2VfdXNlX2xpc3RfaGVh
ZDsNCj4gIAlzdHJ1Y3QgbGlzdF9oZWFkIG9vc19wYWdlX2ZyZWVfbGlzdF9oZWFkOw0KPiArCXN0
cnVjdCBtdXRleCBwcGd0dF9tbV9sb2NrOw0KPiAgCXN0cnVjdCBsaXN0X2hlYWQgcHBndHRfbW1f
bHJ1X2xpc3RfaGVhZDsNCj4gDQo+ICAJc3RydWN0IHBhZ2UgKnNjcmF0Y2hfcGFnZTsNCj4gLS0N
Cj4gMi4yMC4xDQo+IA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXw0KPiBpbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdA0KPiBpbnRlbC1ndnQtZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXYNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
