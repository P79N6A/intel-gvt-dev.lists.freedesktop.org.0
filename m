Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp374166ywa;
        Fri, 15 Feb 2019 00:51:10 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYNrrtxl3o0zzjYDWq3ORTZJOGgMSthEn2IwgSmy0iHBC1wKh3hVeFBybcw+Br5iEFPHq1m
X-Received: by 2002:a62:e704:: with SMTP id s4mr8704411pfh.94.1550220670218;
        Fri, 15 Feb 2019 00:51:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550220670; cv=none;
        d=google.com; s=arc-20160816;
        b=TZXblL2HIHYVHTI3EI510CB3B6q/WBDvrU43mCSv9eegaflKp6EF4YrX+zCYBciJ9g
         cQIXbKOY4Alqv9mm8qHVERlHZU9jFgx4ZmNO2uRt8R2LLb5jbZHZjsF669gjul/xwJaO
         96Jzk/yeeiqLHYq9S0q4ADigB0dReagcqtW7JVFCBcxoHAlDxrbNwikxhJYLjeeMlgd+
         rDuitsPwgTmDUzIiy6SjA+R1jE/7QMWX3Z1uv9+vU8PNNTlie0AzH4OhDi2RJl2F4+Jx
         ws6uTqViLOdMrszu9Cf8kTecvpdX462wHTgIzw/YvcJ5bX7ysidDfrclOt3jjAbAu4GZ
         0clw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence
         :mime-version:dlp-reaction:dlp-version:dlp-product:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:delivered-to;
        bh=8ARqzMEuY49W22HUZFf/5VJhgw8kjB/XXKZeumqVWFE=;
        b=UAQITYG6cLIO4GoKvvS55Hb1w46P1aJu0b1l41qr/t8h0TbY7eAtjROvZvMSZ5OWSF
         EGraX67ihhGQLfCe9Cktxs0pWeY38V97z+4tYlSsBMrrGBzSbhg7zb3PzlHdVoy8FzeO
         0omMoWaZU1mjLULAWywXNGk0nm6AyF7CQikXWIQ/XyiPBm+CwNqNp8FX2UbcBXPGPhIr
         sUyV52AsmLkAeieDP7cHyq6KyMgjY/lvuMxjWXActBB7Oen8uoYPYo2ALhyTSCE3zwcz
         bNRmyYIMu90ZamdHUJW+z2HKaHQN5X0kxDPgth9pOBF4s+uJvujLZdVPdB2vejQQz9Oo
         2rTA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id f10si4659460pgl.528.2019.02.15.00.51.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Feb 2019 00:51:10 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2F2A6EAEC;
	Fri, 15 Feb 2019 08:49:39 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A4906E058
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 15 Feb 2019 01:57:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Feb 2019 17:57:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,371,1544515200"; d="scan'208";a="115076226"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga007.jf.intel.com with ESMTP; 14 Feb 2019 17:57:40 -0800
Received: from fmsmsx156.amr.corp.intel.com (10.18.116.74) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 14 Feb 2019 17:57:39 -0800
Received: from shsmsx105.ccr.corp.intel.com (10.239.4.158) by
 fmsmsx156.amr.corp.intel.com (10.18.116.74) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 14 Feb 2019 17:57:39 -0800
Received: from shsmsx103.ccr.corp.intel.com ([169.254.4.194]) by
 SHSMSX105.ccr.corp.intel.com ([169.254.11.253]) with mapi id 14.03.0415.000;
 Fri, 15 Feb 2019 09:57:37 +0800
From: "He, Min" <min.he@intel.com>
To: "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] Makefile: adding profiling option in Makefile
Thread-Topic: [PATCH 2/2] Makefile: adding profiling option in Makefile
Thread-Index: AQHUxNGpfzPt+PWizk20nI2LUN5u7aXgGf5w
Date: Fri, 15 Feb 2019 01:57:37 +0000
Message-ID: <B8F3B07A09E6B84F88EAD83F055E9945519AD0E8@SHSMSX103.ccr.corp.intel.com>
References: <20190215014204.6650-1-min.he@intel.com>
 <20190215014204.6650-2-min.he@intel.com>
In-Reply-To: <20190215014204.6650-2-min.he@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiM2Q1M2FhNzQtYmU5ZC00NGE1LWEyZWItNTgyZmZhNTRlYjBkIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiY1pvU2ZVS1FEcDNjY0tGOUNZU0p5RnRvQzYrTkNMSlIrQVJacFBOd1F5Z2xaTEhPRXJnanBiV0tPMGUyTzBXSyJ9
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

U2VuZGluZyB0byBhIHdyb25nIG1haWwgbGlzdC4gUGxlYXNlIGlnbm9yZSB0aGlzIHBhdGNoLgoK
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEhlLCBNaW4KPiBTZW50OiBGcmlk
YXksIEZlYnJ1YXJ5IDE1LCAyMDE5IDk6NDIgQU0KPiBUbzogaW50ZWwtZ3Z0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPiBDYzogSGUsIE1pbiA8bWluLmhlQGludGVsLmNvbT4KPiBTdWJqZWN0
OiBbUEFUQ0ggMi8yXSBNYWtlZmlsZTogYWRkaW5nIHByb2ZpbGluZyBvcHRpb24gaW4gTWFrZWZp
bGUKPiAKPiBUaGlzIHBhdGNoIGFkZGVkIGEgb3B0aW9uIHRvIGNvbnRyb2wgcHJvZmlsaW5nIG9u
L29mZiwgYnkgZGVmYXVsdCwKPiBwcm9maWxpbmcgaXMgb24sIHNvIHRoYXQgVlR1bmUgY2FuIGJl
IHVzZWQgdG8gY2FwdHVyZSBwZXJmIGRhdGEgZnJvbQo+IFNPUy4KPiBXaGVuIHJ1bm5pbmc6IG1h
a2UgUFJPRklMSU5HPTAsIGl0IHdpbGwgZGlzYWJsZSBwcm9maWxpbmcgYW5kIHBtdSB3aWxsCj4g
YmUgcGFzcy10aHJ1IGFuZCBwZXJmIHRvb2xzIGNhbiBiZSBydW4gZGlyZWN0bHkgaW5zaWRlIFVP
Uy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNaW4gSGUgPG1pbi5oZUBpbnRlbC5jb20+Cj4gLS0tCj4g
IGh5cGVydmlzb3IvTWFrZWZpbGUgfCA3ICsrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9oeXBlcnZpc29yL01h
a2VmaWxlIGIvaHlwZXJ2aXNvci9NYWtlZmlsZQo+IGluZGV4IDRmYmQ3NWI5Li44MjNjYTdhNiAx
MDA2NDQKPiAtLS0gYS9oeXBlcnZpc29yL01ha2VmaWxlCj4gKysrIGIvaHlwZXJ2aXNvci9NYWtl
ZmlsZQo+IEBAIC0zMiw2ICszMiw4IEBAIEFSQ0hfQVNGTEFHUyA6PQo+ICBBUkNIX0FSRkxBR1Mg
Oj0KPiAgQVJDSF9MREZMQUdTIDo9Cj4gCj4gK1BST0ZJTElORyA/PSAxCj4gKwo+ICAuUEhPTlk6
IGRlZmF1bHQKPiAgZGVmYXVsdDogYWxsCj4gCj4gQEAgLTI2Niw3ICsyNjgsMTAgQEAgZW5kaWYK
PiAKPiAgQ19PQkpTIDo9ICQocGF0c3Vic3QgJS5jLCQoSFZfT0JKRElSKS8lLm8sJChDX1NSQ1Mp
KQo+ICBpZm5lcSAoJChDT05GSUdfUkVMRUFTRSkseSkKPiAtQ0ZMQUdTICs9IC1ESFZfREVCVUcg
LURQUk9GSUxJTkdfT04gLWZuby1vbWl0LWZyYW1lLXBvaW50ZXIKPiArQ0ZMQUdTICs9IC1ESFZf
REVCVUcgLWZuby1vbWl0LWZyYW1lLXBvaW50ZXIKPiAraWZlcSAoJChQUk9GSUxJTkcpLCAxKQo+
ICtDRkxBR1MgKz0gLURQUk9GSUxJTkdfT04KPiArZW5kaWYKPiAgZW5kaWYKPiAgU19PQkpTIDo9
ICQocGF0c3Vic3QgJS5TLCQoSFZfT0JKRElSKS8lLm8sJChTX1NSQ1MpKQo+IAo+IC0tCj4gMi4x
Ny4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRl
bC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2
dC1kZXY=
