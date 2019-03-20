Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5a0b:0:0:0:0:0 with SMTP id o11csp213795ywb;
        Tue, 19 Mar 2019 20:23:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwXIhL5MYa/ZqkTHi9x/Vzx5CiTRLX3nA15P752DqsswtJJD+p5yUBkznJWSJZUn5TUhsq+
X-Received: by 2002:a17:902:7609:: with SMTP id k9mr5722814pll.305.1553052195787;
        Tue, 19 Mar 2019 20:23:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553052195; cv=none;
        d=google.com; s=arc-20160816;
        b=sF7ZqRmw1D+SccA2XSK8CSCADfSv3BUI7hqmyTdC4kjro/UvMRZOHoWp/iUb8XRIvk
         DAundkPQebGV/wTedqtgb7++G51wZJZm/RX6jmUxiM3m6230xmeU0siILLa5kpHP1dUH
         Qo5V/tWUaxKGSVvM7XrAYTAMj4NWsR46OZXpM+ezxWmRBvrAsPf9IH/Ixn5ojJsmmNCj
         TDTbOs6QcML93yB/ULglw4yXRdVcryx6tBW1nE+fo2gJEsKGlUN4fdYVQEAF2sVp5hJV
         /gtOJXpiSoCibXUBTXyL73z6Qvk5Cus/h6Q3Sna5m0jc4xVP/+L8QKhZx/L0EWnzov3V
         DjCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:references:in-reply-to:message-id:date
         :subject:to:from:delivered-to;
        bh=wC34FVP6yN8H/aBIWos7HxipyCgxomvKRJySndz2O00=;
        b=NkKCj9gUZ17rIYoTgQlYpG26Bl0K5DyCLOdKfvA4sXvNBK6TvR2UT+rdCv41rnX7ej
         pINHjSHBLa2vrY/5log/WylTjt7+m2KoQcNHKUsETPR8ejMbPOT52GHkI4gyUKNsefhx
         J9VeB9OobpG+nmKSrLedyMfOaLcDgoQNCyAqtMEaoaq3qEFJOxMLBM0kRhEgwr3pxPLx
         MfeEPUUPixbLRXen0MQQA3NdjOUwo2chLr5c9u7kemltOPShXjjFD/uDtStwyeuv1U4/
         f/hom+Cxe0mJG/Zy3v/7sjpslMqMqUS76VSctoVFKe3g91FrJ6LWuy8R5e1yYX9tY9zU
         blow==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id t9si613192pgl.290.2019.03.19.20.23.15
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2019 20:23:15 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5455189861;
	Wed, 20 Mar 2019 03:23:15 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E8889861
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 20 Mar 2019 03:23:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Mar 2019 20:23:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,246,1549958400"; d="scan'208";a="215707608"
Received: from coxu-arch-shz.sh.intel.com ([10.239.160.25])
 by orsmga001.jf.intel.com with ESMTP; 19 Mar 2019 20:23:13 -0700
From: Colin Xu <colin.xu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 3/6] drm/i915/gvt: Prevent invalid index access to
 vgpu->gtt.scratch_pt[]
Date: Wed, 20 Mar 2019 11:21:27 +0800
Message-Id: <20190320032130.9817-4-colin.xu@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190320032130.9817-1-colin.xu@intel.com>
References: <20190320032130.9817-1-colin.xu@intel.com>
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
Cc: colin.xu@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

SW52YWxpZCBpbmRleCBjb3VsZCByZXN1bHQgaW4gYXJyYXkgb3ZlcmZsb3cgc28gbGltaXQgaXQg
dG8gYXJyYXkgc2l6ZS4KQWx0aG91Z2ggdGhlc2UgYWNjZXNzIGFyZSBwcm90ZWN0ZWQgYnkgY3Vy
cmVudCBndnQgbG9naWMgYW5kIHdvbid0IGhpdApkdXJpbmcgcnVubmluZywgYnV0IHN0aWxsIGhh
cyBwb3RlbnRpYWwgc2VjdXJpdHkgcmlzayBpbiBmdXR1cmUuCkFub3RoZXIgbWlzdGFrZSBpcyBn
dnRfdmdwdV9lcnIgc2hvdWxkbid0IGFjY2VzcyBzcHQgYWZ0ZXIgcHBndHRfZnJlZV9zcHQuCgpT
aWduZWQtb2ZmLWJ5OiBDb2xpbiBYdSA8Y29saW4ueHVAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC9ndHQuYyB8IDUwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Ky0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d2dC9ndHQuYwppbmRleCBmNGM5OTJkOTYwODcuLjM0MDU2NTMzOGEyYSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d2dC9ndHQuYwpAQCAtOTM3LDYgKzkzNywxMiBAQCBzdGF0aWMgaW50IHBwZ3R0
X2ludmFsaWRhdGVfc3B0X2J5X3NoYWRvd19lbnRyeShzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwK
IAlpZiAoZS0+dHlwZSAhPSBHVFRfVFlQRV9QUEdUVF9ST09UX0wzX0VOVFJZCiAJCSYmIGUtPnR5
cGUgIT0gR1RUX1RZUEVfUFBHVFRfUk9PVF9MNF9FTlRSWSkgewogCQljdXJfcHRfdHlwZSA9IGdl
dF9uZXh0X3B0X3R5cGUoZS0+dHlwZSkgKyAxOworCQlpZiAoV0FSTl9PTihjdXJfcHRfdHlwZSA9
PSBHVFRfVFlQRV9JTlZBTElEIHx8CisJCQkgICAgY3VyX3B0X3R5cGUgPj0gR1RUX1RZUEVfTUFY
KSkgeworCQkJZ3Z0X3ZncHVfZXJyKCJmYWlsOiBpbnZhbGlkIHBwZ3R0X3NwdCB0eXBlICVkLlxu
IiwKKwkJCQkgICAgIGN1cl9wdF90eXBlKTsKKwkJCXJldHVybiAtRUlOVkFMOworCQl9CiAJCWlm
IChvcHMtPmdldF9wZm4oZSkgPT0KIAkJCXZncHUtPmd0dC5zY3JhdGNoX3B0W2N1cl9wdF90eXBl
XS5wYWdlX21mbikKIAkJCXJldHVybiAwOwpAQCAtOTYxLDYgKzk2NywxMiBAQCBzdGF0aWMgaW5s
aW5lIHZvaWQgcHBndHRfaW52YWxpZGF0ZV9wdGUoc3RydWN0IGludGVsX3ZncHVfcHBndHRfc3B0
ICpzcHQsCiAJcGZuID0gb3BzLT5nZXRfcGZuKGVudHJ5KTsKIAl0eXBlID0gc3B0LT5zaGFkb3df
cGFnZS50eXBlOwogCisJaWYgKFdBUk5fT04odHlwZSA9PSBHVFRfVFlQRV9JTlZBTElEIHx8IHR5
cGUgPj0gR1RUX1RZUEVfTUFYKSkgeworCQlndnRfZGJnX21tKCJmYWlsOiBpbnZhbGlkIHNwdCgl
cCkgdHlwZSAlZC5cbiIsCisJCQkgICBzcHQsIHR5cGUpOworCQlyZXR1cm47CisJfQorCiAJLyog
VW5pbml0aWFsaXplZCBzcHRlIG9yIHVuc2hhZG93ZWQgc3B0ZS4gKi8KIAlpZiAoIXBmbiB8fCBw
Zm4gPT0gdmdwdS0+Z3R0LnNjcmF0Y2hfcHRbdHlwZV0ucGFnZV9tZm4pCiAJCXJldHVybjsKQEAg
LTEwNjQsNyArMTA3Niw3IEBAIHN0YXRpYyBzdHJ1Y3QgaW50ZWxfdmdwdV9wcGd0dF9zcHQgKnBw
Z3R0X3BvcHVsYXRlX3NwdF9ieV9ndWVzdF9lbnRyeSgKIAkJCXJldCA9IHBwZ3R0X3BvcHVsYXRl
X3NwdChzcHQpOwogCQkJaWYgKHJldCkgewogCQkJCXBwZ3R0X3B1dF9zcHQoc3B0KTsKLQkJCQln
b3RvIGVycjsKKwkJCQlnb3RvIGVycl9wb3B1bGF0ZTsKIAkJCX0KIAkJfQogCX0gZWxzZSB7CkBA
IC0xMDczLDE2ICsxMDg1LDIyIEBAIHN0YXRpYyBzdHJ1Y3QgaW50ZWxfdmdwdV9wcGd0dF9zcHQg
KnBwZ3R0X3BvcHVsYXRlX3NwdF9ieV9ndWVzdF9lbnRyeSgKIAkJc3B0ID0gcHBndHRfYWxsb2Nf
c3B0X2dmbih2Z3B1LCB0eXBlLCBvcHMtPmdldF9wZm4od2UpLCBpcHMpOwogCQlpZiAoSVNfRVJS
KHNwdCkpIHsKIAkJCXJldCA9IFBUUl9FUlIoc3B0KTsKLQkJCWdvdG8gZXJyOworCQkJZ290byBl
cnJfYWxsb2NfZ2ZuOwogCQl9CiAKIAkJcmV0ID0gaW50ZWxfdmdwdV9lbmFibGVfcGFnZV90cmFj
ayh2Z3B1LCBzcHQtPmd1ZXN0X3BhZ2UuZ2ZuKTsKLQkJaWYgKHJldCkKKwkJaWYgKHJldCkgewor
CQkJZ3Z0X3ZncHVfZXJyKCJmYWlsOiBlbmFibGUgdHJhY2sgc2hhZG93IHBhZ2UgJXAgZ3Vlc3Qg
ZW50cnkgMHglbGx4IHR5cGUgJWRcbiIsCisJCQkJICAgICBzcHQsIHdlLT52YWw2NCwgd2UtPnR5
cGUpOwogCQkJZ290byBlcnJfZnJlZV9zcHQ7CisJCX0KIAogCQlyZXQgPSBwcGd0dF9wb3B1bGF0
ZV9zcHQoc3B0KTsKLQkJaWYgKHJldCkKKwkJaWYgKHJldCkgeworCQkJZ3Z0X3ZncHVfZXJyKCJm
YWlsOiBwb3B1bGF0ZSBzaGFkb3cgcGFnZSAlcCBndWVzdCBlbnRyeSAweCVsbHggdHlwZSAlZFxu
IiwKKwkJCQkgICAgIHNwdCwgd2UtPnZhbDY0LCB3ZS0+dHlwZSk7CiAJCQlnb3RvIGVycl9mcmVl
X3NwdDsKKwkJfQogCiAJCXRyYWNlX3NwdF9jaGFuZ2UodmdwdS0+aWQsICJuZXciLCBzcHQsIHNw
dC0+Z3Vlc3RfcGFnZS5nZm4sCiAJCQkJIHNwdC0+c2hhZG93X3BhZ2UudHlwZSk7CkBAIC0xMDkx
LDkgKzExMDksMTkgQEAgc3RhdGljIHN0cnVjdCBpbnRlbF92Z3B1X3BwZ3R0X3NwdCAqcHBndHRf
cG9wdWxhdGVfc3B0X2J5X2d1ZXN0X2VudHJ5KAogCiBlcnJfZnJlZV9zcHQ6CiAJcHBndHRfZnJl
ZV9zcHQoc3B0KTsKLWVycjoKLQlndnRfdmdwdV9lcnIoImZhaWw6IHNoYWRvdyBwYWdlICVwIGd1
ZXN0IGVudHJ5IDB4JWxseCB0eXBlICVkXG4iLAorCWdvdG8gZXJyOworCitlcnJfcG9wdWxhdGU6
CisJZ3Z0X3ZncHVfZXJyKCJmYWlsOiBwb3B1bGF0ZSBzaGFkb3cgcGFnZSAlcCBndWVzdCBlbnRy
eSAweCVsbHggdHlwZSAlZFxuIiwKKwkJICAgICBzcHQsIHdlLT52YWw2NCwgd2UtPnR5cGUpOwor
CWdvdG8gZXJyOworCitlcnJfYWxsb2NfZ2ZuOgorCWd2dF92Z3B1X2VycigiZmFpbDogYWxsb2Mg
Z2ZuIHNoYWRvdyBwYWdlICVwIGd1ZXN0IGVudHJ5IDB4JWxseCB0eXBlICVkXG4iLAogCQkgICAg
IHNwdCwgd2UtPnZhbDY0LCB3ZS0+dHlwZSk7CisJZ290byBlcnI7CisKK2VycjoKIAlyZXR1cm4g
RVJSX1BUUihyZXQpOwogfQogCkBAIC0xNTcyLDYgKzE2MDAsOSBAQCBzdGF0aWMgaW50IHBwZ3R0
X2hhbmRsZV9ndWVzdF93cml0ZV9wYWdlX3RhYmxlKAogCWludCBuZXdfcHJlc2VudDsKIAlpbnQg
aSwgcmV0OwogCisJaWYgKFdBUk5fT04odHlwZSA9PSBHVFRfVFlQRV9JTlZBTElEIHx8IHR5cGUg
Pj0gR1RUX1RZUEVfTUFYKSkKKwkJZ3Z0X3ZncHVfZXJyKCJmYWlsOiBpbnZhbGlkIHNwdCglcCkg
dHlwZSAlZC5cbiIsIHNwdCwgdHlwZSk7CisKIAluZXdfcHJlc2VudCA9IG9wcy0+dGVzdF9wcmVz
ZW50KHdlKTsKIAogCS8qCkBAIC0xNzE0LDYgKzE3NDUsMTMgQEAgc3RhdGljIGludCBwcGd0dF9o
YW5kbGVfZ3Vlc3Rfd3JpdGVfcGFnZV90YWJsZV9ieXRlcygKIAkJaWYgKCF0ZXN0X2JpdChpbmRl
eCwgc3B0LT5wb3N0X3NoYWRvd19iaXRtYXApKSB7CiAJCQlpbnQgdHlwZSA9IHNwdC0+c2hhZG93
X3BhZ2UudHlwZTsKIAorCQkJaWYgKFdBUk5fT04odHlwZSA9PSBHVFRfVFlQRV9JTlZBTElEIHx8
CisJCQkJICAgIHR5cGUgPj0gR1RUX1RZUEVfTUFYKSkgeworCQkJCWd2dF92Z3B1X2VycigiZmFp
bDogaW52YWxpZCBzcHQoJXApIHR5cGUgJWQuXG4iLAorCQkJCQkgICAgIHNwdCwgdHlwZSk7CisJ
CQkJcmV0dXJuIC1FSU5WQUw7CisJCQl9CisKIAkJCXBwZ3R0X2dldF9zaGFkb3dfZW50cnkoc3B0
LCAmc2UsIGluZGV4KTsKIAkJCXJldCA9IHBwZ3R0X2hhbmRsZV9ndWVzdF9lbnRyeV9yZW1vdmFs
KHNwdCwgJnNlLCBpbmRleCk7CiAJCQlpZiAocmV0KQotLSAKMi4yMS4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcg
bGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
