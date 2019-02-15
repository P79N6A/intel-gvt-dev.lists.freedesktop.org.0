Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp374199ywa;
        Fri, 15 Feb 2019 00:51:12 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYKUYBTy1hDht3JYhp1Ns1w3BP9O6vnC2O76uwNNttx1Nxa1iNuhtUAcf4Io0NoXlfYUz8/
X-Received: by 2002:a63:d846:: with SMTP id k6mr4425868pgj.251.1550220672738;
        Fri, 15 Feb 2019 00:51:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550220672; cv=none;
        d=google.com; s=arc-20160816;
        b=F7JheZzosxJt1DtOdgFBoNVX3Sf2kPsCSWlym1FEgd44odH3Y4+r9crMaKOxd96ztr
         40CfsoCF8MSdamLwas3w86XFwjQDfSb97jdAHrBL2qShfHftfemvi6QWPvHhekSGCTFE
         nq+IQy1E3dxr3O5Rd8hzF3ySBmT62mPDcCCvQCsK1awlOuXWjjU90mSwI0atYmWQ5QbO
         oo+3On4DK6YQtQroMclJ8Y/V0QciO868jSwY/qiIi2PyVsae49DjTKb04oBdtCo71GdN
         wNBQbDEJl/lC7sTM8i9uC93V02aPH0jv3YMMc8kt0HYn8A3nDPRVtW1N4k+PjwKRFsPE
         kJ5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:message-id:date:subject:to:from:delivered-to;
        bh=YANjfgkmoe7LzwiN19c/ELx9+/tzSMR3SCCekM3n3Z8=;
        b=KAGuWTBm/fvlTDMUd3E/vdmL7aOYkfgf342Mwp4de3uewVYh7qJeOArrIMxdbnMJ6n
         6bkdHMdATyNDIkxdOtXMyAf2rKOW/a2ffw7AeHokUc4MRdSQ1x0Fi2jBj4u3qR3BDN/M
         JGU7ms0UMg2Wk1NBUbNZScTti9aQjCgI/NmOROftkujlL01oy5ws+kO8SU5iTlhVicqm
         vI0XDW21Ik27yn+k9Zk9M+XSdSn1YlJyW9cqGuqj/GIXaph00vA8iogbBm92ogEIGYI3
         DPHRte7c2VMJJSXudYw8uwCPGntBhNozEcllRWN5tJjC3mL2S6qgFE4xJ+fNyhNqMyD6
         Fzow==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id c21si4774452pfd.55.2019.02.15.00.51.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Feb 2019 00:51:12 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E37E6EAE7;
	Fri, 15 Feb 2019 08:49:39 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB0A16E058
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 15 Feb 2019 01:56:21 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Feb 2019 17:56:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,371,1544515200"; d="scan'208";a="134457898"
Received: from hm-optiplex-9020.sh.intel.com (HELO
 byang1217-clrdev:22530_v2.sh.intel.com) ([10.239.154.42])
 by orsmga002.jf.intel.com with ESMTP; 14 Feb 2019 17:56:19 -0800
From: Min He <min.he@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 1/2] hv: pass-thru PMU registers when no PROFILING_ON
Date: Fri, 15 Feb 2019 01:42:03 +0000
Message-Id: <20190215014204.6650-1-min.he@intel.com>
X-Mailer: git-send-email 2.17.0
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
Cc: Min He <min.he@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

SW4gZGVidWcgdmVyc2lvbiwgd2hlbiBkaXNhYmxpbmcgUFJPRklMSU5HLCB3ZSB3aWxsIHBhc3Mt
dGhydSB0aGUKUE1VIHJlZ2lzdGVycyB0byBhbGxvdyBwZXJmIHRvb2wgdG8gYmUgcnVuIGluIFVP
UyBkaXJlY3RseS4KQWxzbywgYSBQTUkgaW50ZXJydXB0IGhhbmRsZXIgaXMgcmVnaXN0ZXJlZCB0
byBzZW5kIHRoZSBQTUkgaW50ZXJydXB0cwp0byB0aGUgVU9TIHRocm91Z2ggVkxBUElDLgoKU2ln
bmVkLW9mZi1ieTogTWluIEhlIDxtaW4uaGVAaW50ZWwuY29tPgotLS0KIGh5cGVydmlzb3IvYXJj
aC94ODYvZ3Vlc3QvdmNwdWlkLmMgfCAgMiArKwogaHlwZXJ2aXNvci9hcmNoL3g4Ni9ndWVzdC92
bXNyLmMgICB8ICAyICsrCiBoeXBlcnZpc29yL2RlYnVnL2h5cGVyY2FsbC5jICAgICAgIHwgIDgg
KysrKysrKwogaHlwZXJ2aXNvci9kZWJ1Zy9wcm9maWxpbmcuYyAgICAgICB8IDM1ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKwogNCBmaWxlcyBjaGFuZ2VkLCA0NyBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvaHlwZXJ2aXNvci9hcmNoL3g4Ni9ndWVzdC92Y3B1aWQuYyBiL2h5cGVy
dmlzb3IvYXJjaC94ODYvZ3Vlc3QvdmNwdWlkLmMKaW5kZXggZGIzODI0MmIuLmUyMGQyZjM1IDEw
MDY0NAotLS0gYS9oeXBlcnZpc29yL2FyY2gveDg2L2d1ZXN0L3ZjcHVpZC5jCisrKyBiL2h5cGVy
dmlzb3IvYXJjaC94ODYvZ3Vlc3QvdmNwdWlkLmMKQEAgLTIzMCw4ICsyMzAsMTAgQEAgaW50MzJf
dCBzZXRfdmNwdWlkX2VudHJpZXMoc3RydWN0IGFjcm5fdm0gKnZtKQogCQkJCWJyZWFrOwogCiAJ
CQkvKiBUaGVzZSBmZWF0dXJlcyBhcmUgZGlzYWJsZWQgKi8KKyNpZmRlZiBQUk9GSUxJTkdfT04K
IAkJCS8qIFBNVSBpcyBub3Qgc3VwcG9ydGVkICovCiAJCQljYXNlIDB4MGFVOgorI2VuZGlmIC8q
IFBST0ZJTElOR19PTiAqLwogCQkJLyogSW50ZWwgUkRUICovCiAJCQljYXNlIDB4MGZVOgogCQkJ
Y2FzZSAweDEwVToKZGlmZiAtLWdpdCBhL2h5cGVydmlzb3IvYXJjaC94ODYvZ3Vlc3Qvdm1zci5j
IGIvaHlwZXJ2aXNvci9hcmNoL3g4Ni9ndWVzdC92bXNyLmMKaW5kZXggODczYzM2YmMuLmJkYzYy
OWJjIDEwMDY0NAotLS0gYS9oeXBlcnZpc29yL2FyY2gveDg2L2d1ZXN0L3Ztc3IuYworKysgYi9o
eXBlcnZpc29yL2FyY2gveDg2L2d1ZXN0L3Ztc3IuYwpAQCAtMTE0LDYgKzExNCw3IEBAIHN0YXRp
YyBjb25zdCB1aW50MzJfdCB1bnN1cHBvcnRlZF9tc3JzW05VTV9VTlNVUFBPUlRFRF9NU1JTXSA9
IHsKIAlNU1JfU0dYT1dORVJFUE9DSDAsCiAJTVNSX1NHWE9XTkVSRVBPQ0gxLAogCisjaWZkZWYg
UFJPRklMSU5HX09OCiAJLyogUGVyZm9ybWFuY2UgQ291bnRlcnMgYW5kIEV2ZW50czogQ1BVSUQu
MEFILkVBWFsxNTo4XSAqLwogCU1TUl9JQTMyX1BNQzAsCiAJTVNSX0lBMzJfUE1DMSwKQEAgLTE0
Niw2ICsxNDcsNyBAQCBzdGF0aWMgY29uc3QgdWludDMyX3QgdW5zdXBwb3J0ZWRfbXNyc1tOVU1f
VU5TVVBQT1JURURfTVNSU10gPSB7CiAJTVNSX0lBMzJfRklYRURfQ1RSMCwKIAlNU1JfSUEzMl9G
SVhFRF9DVFIxLAogCU1TUl9JQTMyX0ZJWEVEX0NUUjIsCisjZW5kaWYgLyogUFJPRklMSU5HX09O
ICovCiAKIAkvKiBRT1MgQ29uZmlndXJhdGlvbiBkaXNhYmxlZDogQ1BVSUQuMTBILkVDWFsyXSAq
LwogCU1TUl9JQTMyX0wzX1FPU19DRkcsCmRpZmYgLS1naXQgYS9oeXBlcnZpc29yL2RlYnVnL2h5
cGVyY2FsbC5jIGIvaHlwZXJ2aXNvci9kZWJ1Zy9oeXBlcmNhbGwuYwppbmRleCBmMjBmNDNkMy4u
MzJlOTBjZTIgMTAwNjQ0Ci0tLSBhL2h5cGVydmlzb3IvZGVidWcvaHlwZXJjYWxsLmMKKysrIGIv
aHlwZXJ2aXNvci9kZWJ1Zy9oeXBlcmNhbGwuYwpAQCAtNjEsNiArNjEsMTQgQEAgc3RhdGljIGlu
dDMyX3QgaGNhbGxfcHJvZmlsaW5nX29wcyhzdHJ1Y3QgYWNybl92bSAqdm0sIHVpbnQ2NF90IGNt
ZCwgdWludDY0X3QgcGEKIAl9CiAgCXJldHVybiByZXQ7CiB9CisKKyNlbHNlCisKK3N0YXRpYyBp
bnQzMl90IGhjYWxsX3Byb2ZpbGluZ19vcHMoX191bnVzZWQgc3RydWN0IGFjcm5fdm0gKnZtLCBf
X3VudXNlZCB1aW50NjRfdCBjbWQsIF9fdW51c2VkIHVpbnQ2NF90IHBhcmFtKQoreworCXJldHVy
biAtRVBFUk07Cit9CisKICNlbmRpZiAvKiBQUk9GSUxJTkdfT04gKi8KIAogLyoqCmRpZmYgLS1n
aXQgYS9oeXBlcnZpc29yL2RlYnVnL3Byb2ZpbGluZy5jIGIvaHlwZXJ2aXNvci9kZWJ1Zy9wcm9m
aWxpbmcuYwppbmRleCA0MWFmZmY2MC4uM2YyNjE5NjYgMTAwNjQ0Ci0tLSBhL2h5cGVydmlzb3Iv
ZGVidWcvcHJvZmlsaW5nLmMKKysrIGIvaHlwZXJ2aXNvci9kZWJ1Zy9wcm9maWxpbmcuYwpAQCAt
MTQ1NSw0ICsxNDU1LDM5IEBAIHZvaWQgcHJvZmlsaW5nX3NldHVwKHZvaWQpCiAJZGV2X2RiZyhB
Q1JOX0RCR19QUk9GSUxJTkcsICIlczogZXhpdGluZyIsIF9fZnVuY19fKTsKIH0KIAorI2Vsc2UK
KworI2luY2x1ZGUgPGh5cGVydmlzb3IuaD4KKwordm9pZCBwcm9maWxpbmdfdm1lbnRlcl9oYW5k
bGVyKF9fdW51c2VkIHN0cnVjdCBhY3JuX3ZjcHUgKnZjcHUpIHt9Cit2b2lkIHByb2ZpbGluZ19w
cmVfdm1leGl0X2hhbmRsZXIoX191bnVzZWQgc3RydWN0IGFjcm5fdmNwdSAqdmNwdSkge30KK3Zv
aWQgcHJvZmlsaW5nX3Bvc3Rfdm1leGl0X2hhbmRsZXIoX191bnVzZWQgc3RydWN0IGFjcm5fdmNw
dSAqdmNwdSkge30KKworc3RhdGljIHZvaWQgcG11X3Bhc3N0aHJ1X3BtaV9oYW5kbGVyKF9fdW51
c2VkIHVpbnQzMl90IGlycSwgX191bnVzZWQgdm9pZCAqZGF0YSkKK3sKKwlzdHJ1Y3QgYWNybl92
Y3B1ICp2Y3B1ID0gZ2V0X2V2ZXJfcnVuX3ZjcHUoZ2V0X2NwdV9pZCgpKTsKKworCW1zcl93cml0
ZShNU1JfSUEzMl9FWFRfQVBJQ19MVlRfUE1JLCBWRUNUT1JfUE1JfExBUElDX0xWVF9NQVNLKTsK
Kwl2bGFwaWNfc2V0X2xvY2FsX2ludHIodmNwdS0+dm0sIHZjcHUtPnZjcHVfaWQsIEFQSUNfTFZU
X1BNQyk7CisJbXNyX3dyaXRlKE1TUl9JQTMyX0VYVF9BUElDX0xWVF9QTUksIFZFQ1RPUl9QTUkp
OworfQorCit2b2lkIHByb2ZpbGluZ19zZXR1cCh2b2lkKQoreworCXVpbnQxNl90IGNwdTsKKwlp
bnQzMl90IHJldHZhbDsKKworCWNwdSA9IGdldF9jcHVfaWQoKTsKKwlpZiAoY3B1ID09IEJPT1Rf
Q1BVX0lEKXsKKwkJcmV0dmFsID0gcmVxdWVzdF9pcnEoUE1JX0lSUSwKKwkJCQlwbXVfcGFzc3Ro
cnVfcG1pX2hhbmRsZXIsIE5VTEwsIElSUUZfTk9ORSk7CisJCWlmIChyZXR2YWwgPCAwKSB7CisJ
CQlwcl9lcnIoIkZhaWxlZCB0byBhZGQgUE1JIGlzciIpOworCQkJcmV0dXJuOworCQl9CisJfQor
CisJbXNyX3dyaXRlKE1TUl9JQTMyX0VYVF9BUElDX0xWVF9QTUksIFZFQ1RPUl9QTUkpOworfQor
CiAjZW5kaWYKLS0gCjIuMTcuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9pbnRlbC1ndnQtZGV2
