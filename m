Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp6776822ywo;
        Thu, 11 Apr 2019 04:23:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwZBQGYW2o0pKggS0lSWtvR7vuFHf///h2S6ExRKuFhUpNT+OugcYYoaTcB4XO/fNBeGdNC
X-Received: by 2002:aa7:8615:: with SMTP id p21mr49567415pfn.98.1554981804380;
        Thu, 11 Apr 2019 04:23:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554981804; cv=none;
        d=google.com; s=arc-20160816;
        b=zvdLlDXKs5svNeRD7kOuFv8TqCJGH8jO4frL+nmczB3jd4AS7QHj+cIwVlu8BtloxR
         54IEIJjr3e5MckWlWGAq1dmcXMRYHWVKnUNKZpAhV5T61hr9FTLCk+PU3mgnPj9Krxwu
         ETVrIIC2KA+xzT8+wRViHp0tQtrjz3PLCJfMUF4WwGpC7O52Hy/mZBklLyOVF35sUWx3
         hqBbVWVc9O8vfb94JfpjSj51644A7xNpJvojJMxxU/K58Tzweu+sgXINCHQ/qrSFQwa6
         8YyajR1jLXI3BUNq2PNgkiWdPN4w14CJ+iXF0h7Ed5uBgqOg4U0aHfXi1bF1KMqEG78l
         F/yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:dlp-reaction:dlp-version:dlp-product
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:to:from:delivered-to;
        bh=SV9/L0r7/rizlNTA8Uwvl++Z2ctpZYlrQamABASres8=;
        b=x5FgAKYyjHUYOVvVuSmvxLMEn/PgSkoGMsXAkcjKO+R61AQRQAbpffdXr4qMopL2XI
         WaccfkPQpdUN0ev7aOygxB6VcyveXY73xMMncZGAOdvU6YPXNenmoLpGp94yGZp4N2pt
         94/Mezsl/WDF50ID9rcKLDJSkkwvlnjhOapCNcXj+p0noBfKLiQyIe52q9KloU82nQjM
         zf3K4dpTLP1BOzbkfvRNeZk4SADtS/87ETpICdJ/oaMRYwVuVzc7MKofeDkEx1Y7CWK6
         HdzIETPiLJW7bs1++eSgBF3FKR/ObgyTyARyiw1/cQoxkvKUj+Zx5zMwjdIOpqTvOB97
         QAIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id n16si34824035pgb.274.2019.04.11.04.23.24
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2019 04:23:24 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAB1A894E7;
	Thu, 11 Apr 2019 11:23:23 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E7FF894E7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 11 Apr 2019 11:23:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Apr 2019 04:23:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,337,1549958400"; d="scan'208";a="130464601"
Received: from irsmsx110.ger.corp.intel.com ([163.33.3.25])
 by orsmga007.jf.intel.com with ESMTP; 11 Apr 2019 04:23:19 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.31]) by
 irsmsx110.ger.corp.intel.com ([169.254.15.173]) with mapi id 14.03.0415.000;
 Thu, 11 Apr 2019 12:23:18 +0100
From: "Gimbitskii, Aleksei" <aleksei.gimbitskii@intel.com>
To: "Xu, Colin" <colin.xu@intel.com>, "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>
Subject: RE: [PATCH 4/5] drm/i915/gvt: Check if cur_pt_type is valid
Thread-Topic: [PATCH 4/5] drm/i915/gvt: Check if cur_pt_type is valid
Thread-Index: AQHU7dAIq4DYnSVmp0uskxE01AAZJaYxzGSAgAUJT6A=
Date: Thu, 11 Apr 2019 11:23:18 +0000
Message-ID: <1EB9BA72F2F5144BB1A5812E11248EAD18E12A6B@irsmsx105.ger.corp.intel.com>
References: <20190408055502.8474-1-aleksei.gimbitskii@intel.com>
 <20190408055502.8474-4-aleksei.gimbitskii@intel.com>
 <eb907c6f-0b0f-d730-4f47-83ec640efbdc@intel.com>
In-Reply-To: <eb907c6f-0b0f-d730-4f47-83ec640efbdc@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMDc5YmI4N2MtNGU5MS00NWU0LWE0NDgtOTVhZTZmNWVlMzk5IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiU1lQUVZtS3VacERXUzNkempzdk0rbldvNHVVZ3RoRStjUDZpWEQzeE1tTjlVNDdUQllNZlFnU2QwTkk2WmpjZCJ9
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

QWRkaXRpb25hbCBkZWJ1ZyBtZXNzYWdlIGlzIGFkZGVkIGluIG5ldyBwYXRjaCB2ZXJzaW9uLg0K
DQpCUiwgQWxla3NlaS4NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFh1LCBD
b2xpbiANClNlbnQ6IE1vbmRheSwgQXByaWwgOCwgMjAxOSAxMDoyNyBBTQ0KVG86IEdpbWJpdHNr
aWksIEFsZWtzZWkgPGFsZWtzZWkuZ2ltYml0c2tpaUBpbnRlbC5jb20+OyBpbnRlbC1ndnQtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IFdhbmcsIFpoaSBBIDx6aGkuYS53YW5nQGludGVs
LmNvbT47IFpoZW55dSBXYW5nIDx6aGVueXV3QGxpbnV4LmludGVsLmNvbT4NClN1YmplY3Q6IFJl
OiBbUEFUQ0ggNC81XSBkcm0vaTkxNS9ndnQ6IENoZWNrIGlmIGN1cl9wdF90eXBlIGlzIHZhbGlk
DQoNCg0KT24gMjAxOS0wNC0wOCAxMzo1NSwgQWxla3NlaSBHaW1iaXRza2lpIHdyb3RlOg0KPiBT
dGF0aWMgY29kZSBhbmFseXplciB3YXJucyB0aGF0IGluZGV4IHZhbHVlIGZvciBzY3JhdGNoX3B0
IG1heSBiZSANCj4gZXF1YWwgdG8gLTEuIEluZGV4IHZhbHVlIHR5cGUgaXMgaW50ZWxfZ3Z0X2d0
dF90eXBlX3QsIHNvIGl0IG1heSBiZSANCj4gYW55IG51bWJlciBhdCByYW5nZSAtMSB0byAxNy4g
Q2hlY2sgZmlyc3QgaWYgY3VyX3B0X3R5cGUgYW5kIA0KPiBjdXJfcHRfdHlwZSsxIGlzIHZhbGlk
IHZhbHVlcy4NCj4NCj4gVGhpcyBwYXRjaCBmaXhlZCB0aGUgY3JpdGlhbCBpc3N1ZSAjNDIyIHJl
cG9ydGVkIGJ5IGtsb2N3b3JrLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBBbGVrc2VpIEdpbWJpdHNr
aWkgPGFsZWtzZWkuZ2ltYml0c2tpaUBpbnRlbC5jb20+DQo+IENjOiBaaGVueXUgV2FuZyA8emhl
bnl1d0BsaW51eC5pbnRlbC5jb20+DQo+IENjOiBaaGkgV2FuZyA8emhpLmEud2FuZ0BpbnRlbC5j
b20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYyB8IDkgKysrKysr
KystDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0K
Pg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jIA0KPiBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYyBpbmRleCA4ZGNiNjIyM2I5ODUuLjdkYzA5YjM4
OWU1OSANCj4gMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYw0K
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMNCj4gQEAgLTkzNiw3ICs5MzYs
MTQgQEAgc3RhdGljIGludCANCj4gcHBndHRfaW52YWxpZGF0ZV9zcHRfYnlfc2hhZG93X2VudHJ5
KHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LA0KPiAgIA0KPiAgIAlpZiAoZS0+dHlwZSAhPSBHVFRf
VFlQRV9QUEdUVF9ST09UX0wzX0VOVFJZDQo+ICAgCQkmJiBlLT50eXBlICE9IEdUVF9UWVBFX1BQ
R1RUX1JPT1RfTDRfRU5UUlkpIHsNCj4gLQkJY3VyX3B0X3R5cGUgPSBnZXRfbmV4dF9wdF90eXBl
KGUtPnR5cGUpICsgMTsNCj4gKwkJY3VyX3B0X3R5cGUgPSBnZXRfbmV4dF9wdF90eXBlKGUtPnR5
cGUpOw0KPiArDQo+ICsJCWlmICghZ3R0X3R5cGVfaXNfcHQoY3VyX3B0X3R5cGUpIHx8DQo+ICsJ
CQkJIWd0dF90eXBlX2lzX3B0KGN1cl9wdF90eXBlICsgMSkpDQo+ICsJCQlyZXR1cm4gLUVJTlZB
TDsNCg0KSXQncyBiZXR0ZXIgdG8gbGVhdmUgc29tZSBkYmdtc2cgZm9yIGludmFsaWQgdHlwZS4N
Cg0KPiArDQo+ICsJCWN1cl9wdF90eXBlICs9IDE7DQo+ICsNCj4gICAJCWlmIChvcHMtPmdldF9w
Zm4oZSkgPT0NCj4gICAJCQl2Z3B1LT5ndHQuc2NyYXRjaF9wdFtjdXJfcHRfdHlwZV0ucGFnZV9t
Zm4pDQo+ICAgCQkJcmV0dXJuIDA7DQoNCi0tDQpCZXN0IFJlZ2FyZHMsDQpDb2xpbiBYdQ0KDQot
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KSW50ZWwgRmlubGFuZCBPeQpSZWdpc3RlcmVkIEFkZHJlc3M6IFBMIDI4MSwg
MDAxODEgSGVsc2lua2kgCkJ1c2luZXNzIElkZW50aXR5IENvZGU6IDAzNTc2MDYgLSA0IApEb21p
Y2lsZWQgaW4gSGVsc2lua2kgCgpUaGlzIGUtbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIG1heSBj
b250YWluIGNvbmZpZGVudGlhbCBtYXRlcmlhbCBmb3IKdGhlIHNvbGUgdXNlIG9mIHRoZSBpbnRl
bmRlZCByZWNpcGllbnQocykuIEFueSByZXZpZXcgb3IgZGlzdHJpYnV0aW9uCmJ5IG90aGVycyBp
cyBzdHJpY3RseSBwcm9oaWJpdGVkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQKcmVjaXBp
ZW50LCBwbGVhc2UgY29udGFjdCB0aGUgc2VuZGVyIGFuZCBkZWxldGUgYWxsIGNvcGllcy4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRl
diBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
