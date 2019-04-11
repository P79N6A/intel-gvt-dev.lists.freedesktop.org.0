Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp6527553ywo;
        Wed, 10 Apr 2019 22:46:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwszCPF9cvs+E2QMdIDPJmxFrB+t5aADc0AduBE0zNP+opWLmaSdHNqTVWVNzIvRNhe/WKj
X-Received: by 2002:a63:f40d:: with SMTP id g13mr46126612pgi.345.1554961577301;
        Wed, 10 Apr 2019 22:46:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554961577; cv=none;
        d=google.com; s=arc-20160816;
        b=tApBkrs+rFz2bGx5WqrNnSObzsK1w4YmNe8RUNiWjnHd42E22zxr9eYAXvlzgzmO5r
         WRM++b9UjB/eVCv8nqjWmHQeDNY47JqwtpDv8HdpykbIsHW1p6xfijZflH2wDwLMFeGh
         GudS79syRy+8JsKLZKRWjBof0/iLZZe7hlILMy7bobN3X4a8g9HmS/IvNAxULOqmWYVC
         +jfxE8d3ww78zba5Kta0C1K7kkMd5bKkNbAVPVk6gdpsYnsug6JHUf08QzTDD+8WahRj
         uGZG3ntkBwqwnitXOjuaN0uPENVKFhCeHow1WD4+y1wuCVKuqAm1yxyFMz3drV7e91hA
         lRHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:content-language:accept-language:references
         :message-id:date:thread-index:thread-topic:subject:to:from
         :delivered-to;
        bh=F/HYB0rx37NzJCv7Yb3TwKoQYMoq2myj6E+j7O4o1Pg=;
        b=BE8EJPNVdK5SAKG/DzXrnOSt6gBlUTuBHrHnhH58bECp6YUCa/7q0TFUMREyOI4fYj
         ayCNoiw9BfCnueOFA6fvjPkoc6XdwCOYNf4LU2bvNpPbJrbrhQLuaDfqF/H8wmmARddx
         UpfO9P8B0VPDP0TAPVUkVKLfU2JdXbZcabyhYRbdn9W9Z4oi/O+ty+mIqE3S+7nmVsez
         jiifdb/2AaESrVE28hthpLBE0UCIYnNLtPrXSXUt456emGfuMIKAlWYagEfFa/Hn6V7g
         OKuEzMD83uNCTVfFCxPJfXtcn/Lk5xBWKEO8a4tggEfco19Jm0PsrbHUUliUpl43Gx7w
         onPA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id u8si8647349pgo.122.2019.04.10.22.46.16
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Apr 2019 22:46:17 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56EE38980C;
	Thu, 11 Apr 2019 05:46:16 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB3A89804;
 Thu, 11 Apr 2019 05:46:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Apr 2019 22:46:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,336,1549958400"; d="scan'208";a="163284703"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by fmsmga001.fm.intel.com with ESMTP; 10 Apr 2019 22:46:15 -0700
Received: from shsmsx108.ccr.corp.intel.com (10.239.4.97) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 10 Apr 2019 22:46:14 -0700
Received: from shsmsx107.ccr.corp.intel.com ([169.254.9.153]) by
 SHSMSX108.ccr.corp.intel.com ([169.254.8.147]) with mapi id 14.03.0415.000;
 Thu, 11 Apr 2019 13:46:12 +0800
From: "Zhang, Xiaolin" <xiaolin.zhang@intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>
Subject: Re: [PATCH v4 4/8] drm/i915: vgpu context submission pv optimization
Thread-Topic: [PATCH v4 4/8] drm/i915: vgpu context submission pv optimization
Thread-Index: AQHU5eQVHTRFc4J84Uie4+snRAcfOA==
Date: Thu, 11 Apr 2019 05:46:12 +0000
Message-ID: <073732E20AE4C540AE91DBC3F07D446087649737@SHSMSX107.ccr.corp.intel.com>
References: <1553866364-111114-1-git-send-email-xiaolin.zhang@intel.com>
 <1553866364-111114-5-git-send-email-xiaolin.zhang@intel.com>
 <155387400537.24691.10910151885848243897@skylake-alporthouse-com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.4.101]
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
Cc: "Wang, Zhenyu Z" <zhenyu.z.wang@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>, "He, Min" <min.he@intel.com>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gMDMvMjkvMjAxOSAxMTo0MCBQTSwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IFF1b3RpbmcgWGlh
b2xpbiBaaGFuZyAoMjAxOS0wMy0yOSAxMzozMjo0MCkKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2k5MTVfaXJxLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2lycS5j
Cj4+IGluZGV4IDJmNzg4MjkuLjI4ZThlZTAgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2k5MTVfaXJxLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9pcnEu
Ywo+PiBAQCAtMzcsNiArMzcsNyBAQAo+PiAgI2luY2x1ZGUgImk5MTVfZHJ2LmgiCj4+ICAjaW5j
bHVkZSAiaTkxNV90cmFjZS5oIgo+PiAgI2luY2x1ZGUgImludGVsX2Rydi5oIgo+PiArI2luY2x1
ZGUgImk5MTVfdmdwdS5oIgo+PiAgCj4+ICAvKioKPj4gICAqIERPQzogaW50ZXJydXB0IGhhbmRs
aW5nCj4+IEBAIC0xNDcwLDYgKzE0NzEsNyBAQCBnZW44X2NzX2lycV9oYW5kbGVyKHN0cnVjdCBp
bnRlbF9lbmdpbmVfY3MgKmVuZ2luZSwgdTMyIGlpcikKPj4gICAgICAgICBpZiAoaWlyICYgR1Rf
UkVOREVSX1VTRVJfSU5URVJSVVBUKSB7Cj4+ICAgICAgICAgICAgICAgICBpbnRlbF9lbmdpbmVf
YnJlYWRjcnVtYnNfaXJxKGVuZ2luZSk7Cj4+ICAgICAgICAgICAgICAgICB0YXNrbGV0IHw9IFVT
RVNfR1VDX1NVQk1JU1NJT04oZW5naW5lLT5pOTE1KTsKPj4gKyAgICAgICAgICAgICAgIHRhc2ts
ZXQgfD0gVVNFU19QVl9TVUJNSVNTSU9OKGVuZ2luZS0+aTkxNSk7Cj4gV2Ugc2hvdWxkIG1vdmUg
dGhpcyB0byBhbiBlbmdpbmUtPmZsYWcuCnN1cmUsIEkgd2lsbCByZW1vdmUgdGhpcyBuZXh0IHZl
cnNpb24uCj4KPj4gICAgICAgICB9Cj4+ICAKPj4gICAgICAgICBpZiAodGFza2xldCkKPj4gK3N0
YXRpYyB2b2lkIHZncHVfcHZfc2V0X2RlZmF1bHRfc3VibWlzc2lvbihzdHJ1Y3QgaW50ZWxfZW5n
aW5lX2NzICplbmdpbmUpCj4+ICt7Cj4+ICsgICAgICAgLyoKPj4gKyAgICAgICAgKiBXZSBpbmhl
cml0IGEgYnVuY2ggb2YgZnVuY3Rpb25zIGZyb20gZXhlY2xpc3RzIHRoYXQgd2UnZCBsaWtlCj4+
ICsgICAgICAgICogdG8ga2VlcCB1c2luZzoKPj4gKyAgICAgICAgKgo+PiArICAgICAgICAqICAg
IGVuZ2luZS0+c3VibWl0X3JlcXVlc3QgPSBleGVjbGlzdHNfc3VibWl0X3JlcXVlc3Q7Cj4+ICsg
ICAgICAgICogICAgZW5naW5lLT5jYW5jZWxfcmVxdWVzdHMgPSBleGVjbGlzdHNfY2FuY2VsX3Jl
cXVlc3RzOwo+PiArICAgICAgICAqICAgIGVuZ2luZS0+c2NoZWR1bGUgPSBleGVjbGlzdHNfc2No
ZWR1bGU7Cj4+ICsgICAgICAgICoKPj4gKyAgICAgICAgKiBCdXQgd2UgbmVlZCB0byBvdmVycmlk
ZSB0aGUgYWN0dWFsIHN1Ym1pc3Npb24gYmFja2VuZCBpbiBvcmRlcgo+PiArICAgICAgICAqIHRv
IHRhbGsgdG8gdGhlIEdWVCB3aXRoIFBWIG5vdGlmaWNhdGlvbiBtZXNzYWdlLgo+PiArICAgICAg
ICAqLwo+PiArICAgICAgIGludGVsX2V4ZWNsaXN0c19zZXRfZGVmYXVsdF9zdWJtaXNzaW9uKGVu
Z2luZSk7Cj4+ICsKPj4gKyAgICAgICBlbmdpbmUtPmV4ZWNsaXN0cy50YXNrbGV0LmZ1bmMgPSB2
Z3B1X3B2X3N1Ym1pc3Npb25fdGFza2xldDsKPiBZb3UgbmVlZCB0byBwaW4gdGhlIGJyZWFkY3J1
bWJzIGlycSwgb3IgaXQgd2lsbCBub3QgZmlyZSBvbiBldmVyeQo+IHJlcXVlc3QuCmluZGVlZCwg
SSBzaG91bGQgZG8uIHRoYW5rcyB5b3VyIGdyZWF0IHBvaW50Lgo+IEknZCBwdXNoIGZvciB0aGlz
IHRvIGxpdmUgaW4gaW50ZWxfcHZfc3VibWlzc2lvbi5jIG9yCj4gaW50ZWxfdmdwdV9zdWJtaXNz
aW9uLmMKdGhpcyB3aWxsIGNyZWF0ZSBuZXcgZmlsZSBhbmQgbWFrZSBhIGNoYW5nZSAgaW4gTWFr
ZWZpbGUuIGlmIHRoaXMga2luZApvZiBjaGFuZ2UgaXMgT0ssCkkgd2lsbCBjcmVhdGUgb25lIHRv
IHVzZSBpbnRlbF9wdl9zdWJtaXNzaW9uLmMgbmFtZS4KPj4gQEAgLTQwMSw2ICs1NTEsMTIgQEAg
dm9pZCBpbnRlbF92Z3B1X2NvbmZpZ19wdl9jYXBzKHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpk
ZXZfcHJpdiwKPj4gICAgICAgICAgICAgICAgIHBwZ3R0LT52bS5pbnNlcnRfZW50cmllcyA9IGdl
bjhfcHBndHRfaW5zZXJ0XzRsdmxfcHY7Cj4+ICAgICAgICAgICAgICAgICBwcGd0dC0+dm0uY2xl
YXJfcmFuZ2UgPSBnZW44X3BwZ3R0X2NsZWFyXzRsdmxfcHY7Cj4+ICAgICAgICAgfQo+PiArCj4+
ICsgICAgICAgaWYgKGNhcCA9PSBQVl9TVUJNSVNTSU9OKSB7Cj4+ICsgICAgICAgICAgICAgICBl
bmdpbmUgPSAoc3RydWN0IGludGVsX2VuZ2luZV9jcyAqKWRhdGE7Cj4+ICsgICAgICAgICAgICAg
ICBlbmdpbmUtPnNldF9kZWZhdWx0X3N1Ym1pc3Npb24gPSB2Z3B1X3B2X3NldF9kZWZhdWx0X3N1
Ym1pc3Npb247Cj4+ICsgICAgICAgICAgICAgICBlbmdpbmUtPnNldF9kZWZhdWx0X3N1Ym1pc3Np
b24oZW5naW5lKTsKPj4gKyAgICAgICB9Cj4+ICB9Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9pbnRlbF9scmMuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2xyYy5j
Cj4+IGluZGV4IGMxYjk3ODAuLjBhNjY3MTQgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2ludGVsX2xyYy5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2xy
Yy5jCj4+IEBAIC0yMzUyLDYgKzIzNTIsOSBAQCBsb2dpY2FsX3JpbmdfZGVmYXVsdF92ZnVuY3Mo
c3RydWN0IGludGVsX2VuZ2luZV9jcyAqZW5naW5lKQo+PiAgICAgICAgICAgICAgICAgICovCj4+
ICAgICAgICAgfQo+PiAgICAgICAgIGVuZ2luZS0+ZW1pdF9iYl9zdGFydCA9IGdlbjhfZW1pdF9i
Yl9zdGFydDsKPj4gKwo+PiArICAgICAgIGlmIChpbnRlbF92Z3B1X2FjdGl2ZShlbmdpbmUtPmk5
MTUpKQo+PiArICAgICAgICAgICAgICAgaW50ZWxfdmdwdV9jb25maWdfcHZfY2FwcyhlbmdpbmUt
Pmk5MTUsIFBWX1NVQk1JU1NJT04sIGVuZ2luZSk7Cj4gVGhhdCBwYWlyIGlzIHVnbHkuIFNob3Vs
ZCBjbGVhbiB1cCB0aGUgZW5naW5lIGluaXRpYWxpc2F0aW9uIHNvIHRoYXQgaXQKPiBkb2Vzbid0
IGludm9sdmUgcGxhY2luZyBhIGNodW5rIG9mIGNvZGUgaW4gYSBmb3JlaWduIGNsYXNzLgo+IC1D
aHJpcwo+ClllcCwgd2lsbCBtb3ZlIGl0IHRvIG90aGVyIGxvY2F0aW9uLgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGlu
ZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
