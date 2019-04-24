Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp24233ywo;
        Tue, 23 Apr 2019 18:51:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwUlfNIBYvxArjwC0HgwPH3/UVgqXm5AueMjE3qFSCO15yUluonYekQsnvRCeL9GWJNoEEE
X-Received: by 2002:a62:be13:: with SMTP id l19mr30984601pff.137.1556070704042;
        Tue, 23 Apr 2019 18:51:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556070704; cv=none;
        d=google.com; s=arc-20160816;
        b=aYKcjPe9kabw/Qd+DYtg50CtZhL5Hh8YScjWtdck1LpY7CkAyF1o9BXI55VWWgAHwS
         WLAH6JyHepgo6konPzSQk7fCF/r+GqF3CyMQ+spMnN8u4Z39qyu7r7NgWH8UScgDSZBh
         Vwd09OPDl9Mhl2cj5kvRtrEFjlTBABdULpSkfY/N9jPGjQImyY7mAWIg+KiOeJrVq4/X
         NF39XqG1cgK62NcV8rCC2hA6r35bFb6x6ujFZGd+KJWErrPZ2QpHuMqLxSTtcfrikgCP
         pVy2UhPxvwpw6AODBtHlCJ+s+MlRRuxUn3CN2qFYJ75aw2Ktolbw0VP01dP5Q4/a/CJm
         72DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:content-language:accept-language:references
         :message-id:date:thread-index:thread-topic:subject:to:from
         :delivered-to;
        bh=gfTbPb7xZrNyOLfQq0hzb9EVTAT6Uho7xSRrn/hmGiQ=;
        b=KCc/A6Ju++3Jpr7hy7luaHgPAx3qcfEBk3aWdrCpBj0ZmMd2IrbkYjhJHZ3keNnlvl
         7iGHZOP40FU6icEMZW+oXe7Mbynt+zub8c22X4RojzpfnozX2xSLuNn6Ka0FD49bPULL
         ifTypPIkww/dbq0PEolSEluSmx3QSWH0Kjj7/sLgfzT0vTzJumjFN2M5TerM2QY9t6sR
         nf1wTq0YOqwrPP0egMhjkJLFS4k8as0y/BVwZbds7Q0c9S2wlsUqzhcK9JT74Q54MdNx
         hbjuAokToW50JoO6cwOnO7z68YHohGO5rQ41dlLNcDUl1kpZqC8lz2jmU04dtWF9lNc/
         trdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id a66si19428515pfb.210.2019.04.23.18.51.43
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Apr 2019 18:51:44 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 571A689144;
	Wed, 24 Apr 2019 01:51:43 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B3F989144
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 24 Apr 2019 01:51:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Apr 2019 18:51:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,387,1549958400"; d="scan'208";a="294012602"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by orsmga004.jf.intel.com with ESMTP; 23 Apr 2019 18:51:40 -0700
Received: from fmsmsx153.amr.corp.intel.com (10.18.125.6) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Tue, 23 Apr 2019 18:51:40 -0700
Received: from shsmsx105.ccr.corp.intel.com (10.239.4.158) by
 FMSMSX153.amr.corp.intel.com (10.18.125.6) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Tue, 23 Apr 2019 18:51:40 -0700
Received: from shsmsx107.ccr.corp.intel.com ([169.254.9.153]) by
 SHSMSX105.ccr.corp.intel.com ([169.254.11.25]) with mapi id 14.03.0415.000;
 Wed, 24 Apr 2019 09:51:38 +0800
From: "Zhang, Xiaolin" <xiaolin.zhang@intel.com>
To: "Zhang, Tina" <tina.zhang@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: Remove logging when checking surface base
 address
Thread-Topic: [PATCH] drm/i915/gvt: Remove logging when checking surface
 base address
Thread-Index: AQHU+j6MkQ90hrj0gU6UIqzFR9uurQ==
Date: Wed, 24 Apr 2019 01:51:37 +0000
Message-ID: <073732E20AE4C540AE91DBC3F07D44608764DECD@SHSMSX107.ccr.corp.intel.com>
References: <1556069636-10440-1-git-send-email-tina.zhang@intel.com>
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
Cc: "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gMDQvMjQvMjAxOSAwOTozOSBBTSwgWmhhbmcsIFRpbmEgd3JvdGU6Cj4gVGhlIHZncHUncyBw
bGFuZSBzdXJmYWNlIGJhc2UgYWRkcmVzcyByZWdpc3RlciBjb3VsZCBjb250YWluIGludmFsaWRh
dGVkCj4gdmFsdWVzLiBPbmx5IHZhbGlkYXRlZCB2YWx1ZXMgY2FuIGJlIHVzZWQgYnkgR1ZULWcg
ZGlzcGxheSBtb2RlbC4KPiBJbnZhbGlkYXRlZCB2YWx1ZXMgc2hvdWxkIGJlIGlnbm9yZWQgdy9v
IGNhdXNpbmcgYW55IG5vaXNlLgo+Cj4gQ2M6IFhpYW9saW4gWmhhbmcgPHhpYW9saW4uemhhbmdA
aW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFRpbmEgWmhhbmcgPHRpbmEuemhhbmdAaW50ZWwu
Y29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZmJfZGVjb2Rlci5jIHwgNiAr
KystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkK
Pgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZmJfZGVjb2Rlci5jIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2ZiX2RlY29kZXIuYwo+IGluZGV4IDY1ZTg0NzMuLjM1
NjRiYzQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2ZiX2RlY29kZXIu
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9mYl9kZWNvZGVyLmMKPiBAQCAtMjQ1
LDcgKzI0NSw3IEBAIGludCBpbnRlbF92Z3B1X2RlY29kZV9wcmltYXJ5X3BsYW5lKHN0cnVjdCBp
bnRlbF92Z3B1ICp2Z3B1LAo+ICAJcGxhbmUtPmh3X2Zvcm1hdCA9IGZtdDsKPiAgCj4gIAlwbGFu
ZS0+YmFzZSA9IHZncHVfdnJlZ190KHZncHUsIERTUFNVUkYocGlwZSkpICYgSTkxNV9HVFRfUEFH
RV9NQVNLOwo+IC0JaWYgKCFpbnRlbF9ndnRfZ2d0dF92YWxpZGF0ZV9yYW5nZSh2Z3B1LCBwbGFu
ZS0+YmFzZSwgMCkpCj4gKwlpZiAoIXBsYW5lLT5iYXNlIHx8ICF2Z3B1X2dtYWRyX2lzX3ZhbGlk
KHZncHUsIHBsYW5lLT5iYXNlKSkKPiAgCQlyZXR1cm4gIC1FSU5WQUw7CkkgdGhpbmsgd2Ugc3Rp
bGwgZmlyZSBlcnJvciBtZXNzYWdlIGluIHNlY29uZCBjaGVjayBmb3Igbm9uIHplcm8gYmFzZQpj
YXNlIHRvIGluZGljYXRlIHRoZXJlIGlzIHNvbWV0aGluZyB3cm9uZy4KPgo+ICAJcGxhbmUtPmJh
c2VfZ3BhID0gaW50ZWxfdmdwdV9nbWFfdG9fZ3BhKHZncHUtPmd0dC5nZ3R0X21tLCBwbGFuZS0+
YmFzZSk7Cj4gQEAgLTM2OCw3ICszNjgsNyBAQCBpbnQgaW50ZWxfdmdwdV9kZWNvZGVfY3Vyc29y
X3BsYW5lKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LAo+ICAJCQlhbHBoYV9wbGFuZSwgYWxwaGFf
Zm9yY2UpOwo+ICAKPiAgCXBsYW5lLT5iYXNlID0gdmdwdV92cmVnX3QodmdwdSwgQ1VSQkFTRShw
aXBlKSkgJiBJOTE1X0dUVF9QQUdFX01BU0s7Cj4gLQlpZiAoIWludGVsX2d2dF9nZ3R0X3ZhbGlk
YXRlX3JhbmdlKHZncHUsIHBsYW5lLT5iYXNlLCAwKSkKPiArCWlmICghcGxhbmUtPmJhc2UgfHwg
IXZncHVfZ21hZHJfaXNfdmFsaWQodmdwdSwgcGxhbmUtPmJhc2UpKQo+ICAJCXJldHVybiAgLUVJ
TlZBTDsKPiAgCj4gIAlwbGFuZS0+YmFzZV9ncGEgPSBpbnRlbF92Z3B1X2dtYV90b19ncGEodmdw
dS0+Z3R0LmdndHRfbW0sIHBsYW5lLT5iYXNlKTsKPiBAQCAtNDcyLDcgKzQ3Miw3IEBAIGludCBp
bnRlbF92Z3B1X2RlY29kZV9zcHJpdGVfcGxhbmUoc3RydWN0IGludGVsX3ZncHUgKnZncHUsCj4g
IAlwbGFuZS0+ZHJtX2Zvcm1hdCA9IGRybV9mb3JtYXQ7Cj4gIAo+ICAJcGxhbmUtPmJhc2UgPSB2
Z3B1X3ZyZWdfdCh2Z3B1LCBTUFJTVVJGKHBpcGUpKSAmIEk5MTVfR1RUX1BBR0VfTUFTSzsKPiAt
CWlmICghaW50ZWxfZ3Z0X2dndHRfdmFsaWRhdGVfcmFuZ2UodmdwdSwgcGxhbmUtPmJhc2UsIDAp
KQo+ICsJaWYgKCFwbGFuZS0+YmFzZSB8fCAhdmdwdV9nbWFkcl9pc192YWxpZCh2Z3B1LCBwbGFu
ZS0+YmFzZSkpCj4gIAkJcmV0dXJuICAtRUlOVkFMOwo+ICAKPiAgCXBsYW5lLT5iYXNlX2dwYSA9
IGludGVsX3ZncHVfZ21hX3RvX2dwYSh2Z3B1LT5ndHQuZ2d0dF9tbSwgcGxhbmUtPmJhc2UpOwoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2
dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRl
dg==
