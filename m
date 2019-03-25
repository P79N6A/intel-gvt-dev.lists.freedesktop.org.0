Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5710:0:0:0:0:0 with SMTP id l16csp3366964ywb;
        Mon, 25 Mar 2019 01:25:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxQ8AJFeruyp76qEmQXdheNDx9RLh0fPEohlQRXG6K5uR8D90SANyrEHUOJxj8KWh73NhYq
X-Received: by 2002:a17:902:b181:: with SMTP id s1mr23742540plr.321.1553502356656;
        Mon, 25 Mar 2019 01:25:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553502356; cv=none;
        d=google.com; s=arc-20160816;
        b=z+UyW1Z9zrBuoekX+t22J4RCuwxZIBwmo3+B6f7F36CJwtNkomYZUafV/RnJKLl2KZ
         ST6qohFE5l4SiDVNqJVoEPnZIqifImiTrIBu+6AodvjAaRtwr4flRUDAMvmXqs74rmfQ
         uFjebqivvtVjEoo6RAteIBj9fuaG1HBPqLOI/zc91JI1Xq93FONvYJ2y8C3v0R2mtls+
         0enB1KaL26+/DyxJk9durQZxsavNRbnHpUgO3w0HX4InjwMcznR/jEP15SleoIx0IgaO
         /0xVKgHPtfj+KZ1Ct4jTCJZNCnOdAZBrvN/nl2iyznF9V2gFZi63HYUssRXTmeKqeOqV
         IkZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=p+bsM0UBCI2eby9pualsDNqYyCmwUSdK7iTsQfSpdno=;
        b=yTF2iBXjxP5pUmdX1APNEk/pHauzQdBv7Zl2nBn90UD8pRHritArUR+8v/Bdqm1xPd
         Q8AK8L7aO9qa41bS//Lz6rCERMyQLzGRKJCh9qjyl8q5qbhp+NwMRHEnVudCLBH2CyLs
         MTixXdlm5/AhgR0HrNykxFNG4t0mS8Q+yZikniErjy54M35yR2yZYG419uTIxLtsuE2h
         /O0u9r/eMekPbCiCF3ICxYbd51VwTPUVbBqViDGW1zm1UkmJ0jWxfq5d3ir7bO78MvgZ
         YgKYe9Rd8wpdeBMKLI6DxDbeo4EU7bFtHjj3GbbIB6SjbEABKu0Pq3d6/X5VBzkUx+yM
         9+ew==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id w23si12415410pga.454.2019.03.25.01.25.55
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Mar 2019 01:25:56 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C01E36E671;
	Mon, 25 Mar 2019 08:25:55 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEF1D6E671
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 25 Mar 2019 08:25:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Mar 2019 01:25:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,256,1549958400"; d="scan'208";a="144974282"
Received: from test-optiplex-7040.bj.intel.com ([10.238.154.166])
 by orsmga002.jf.intel.com with ESMTP; 25 Mar 2019 01:25:52 -0700
From: Xiong Zhang <xiong.y.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/i915/gvt: Correct the calculation of plane size
Date: Mon, 25 Mar 2019 16:29:19 +0800
Message-Id: <1553502560-3796-1-git-send-email-xiong.y.zhang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <20190321075254.GG10798@zhen-hp.sh.intel.com>
References: <20190321075254.GG10798@zhen-hp.sh.intel.com>
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
Cc: Xiong Zhang <xiong.y.zhang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

c3RyaWRlIGlzbid0IGluIHVuaXQgb2YgcGl4ZWwsIGl0IGlzIGJ5dGVzLCBzbyBjYWxjdWxhdGlv
biBvZgpwbGFuZSBzaXplIGRvZXNuJ3QgbmVlZCB0byBtdWx0aXBsZSBicHAuCgpGaXhlczogZTU0
NmUyODFkMzMoImRybS9pOTE1L2d2dDogRG1hYnVmIHN1cHBvcnQgZm9yIEdWVC1nIikKClNpZ25l
ZC1vZmYtYnk6IFhpb25nIFpoYW5nIDx4aW9uZy55LnpoYW5nQGludGVsLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZG1hYnVmLmMgfCA4ICsrLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC9kbWFidWYuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kbWFi
dWYuYwppbmRleCAzZTdlMmI4Li41ZDg4N2Y3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndnQvZG1hYnVmLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2RtYWJ1Zi5j
CkBAIC0yMzgsOSArMjM4LDYgQEAgc3RhdGljIGludCB2Z3B1X2dldF9wbGFuZV9pbmZvKHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYsCiAJCWRlZmF1bHQ6CiAJCQlndnRfdmdwdV9lcnIoImludmFsaWQg
dGlsaW5nIG1vZGU6ICV4XG4iLCBwLnRpbGVkKTsKIAkJfQotCi0JCWluZm8tPnNpemUgPSAoKChw
LnN0cmlkZSAqIHAuaGVpZ2h0ICogcC5icHApIC8gOCkgKwotCQkJICAgICAgKFBBR0VfU0laRSAt
IDEpKSA+PiBQQUdFX1NISUZUOwogCX0gZWxzZSBpZiAocGxhbmVfaWQgPT0gRFJNX1BMQU5FX1RZ
UEVfQ1VSU09SKSB7CiAJCXJldCA9IGludGVsX3ZncHVfZGVjb2RlX2N1cnNvcl9wbGFuZSh2Z3B1
LCAmYyk7CiAJCWlmIChyZXQpCkBAIC0yNjIsMTQgKzI1OSwxMyBAQCBzdGF0aWMgaW50IHZncHVf
Z2V0X3BsYW5lX2luZm8oc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAkJCWluZm8tPnhfaG90ID0g
VUlOVF9NQVg7CiAJCQlpbmZvLT55X2hvdCA9IFVJTlRfTUFYOwogCQl9Ci0KLQkJaW5mby0+c2l6
ZSA9ICgoKGluZm8tPnN0cmlkZSAqIGMuaGVpZ2h0ICogYy5icHApIC8gOCkKLQkJCQkrIChQQUdF
X1NJWkUgLSAxKSkgPj4gUEFHRV9TSElGVDsKIAl9IGVsc2UgewogCQlndnRfdmdwdV9lcnIoImlu
dmFsaWQgcGxhbmUgaWQ6JWRcbiIsIHBsYW5lX2lkKTsKIAkJcmV0dXJuIC1FSU5WQUw7CiAJfQog
CisJaW5mby0+c2l6ZSA9IChpbmZvLT5zdHJpZGUgKiBpbmZvLT5oZWlnaHQgKyBQQUdFX1NJWkUg
LSAxKQorCQkgICAgICA+PiBQQUdFX1NISUZUOwogCWlmIChpbmZvLT5zaXplID09IDApIHsKIAkJ
Z3Z0X3ZncHVfZXJyKCJmYiBzaXplIGlzIHplcm9cbiIpOwogCQlyZXR1cm4gLUVJTlZBTDsKLS0g
CjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
bnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVs
LWd2dC1kZXY=
