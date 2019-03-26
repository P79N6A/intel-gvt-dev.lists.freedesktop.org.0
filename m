Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5710:0:0:0:0:0 with SMTP id l16csp4460551ywb;
        Mon, 25 Mar 2019 23:42:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx2gwai/bIf9s0+LujigKFBD0HcNYht121HkEn9ryZBqOyoqmrougjBTQqSjiR4EPEWlcFl
X-Received: by 2002:a17:902:2e83:: with SMTP id r3mr12012971plb.153.1553582534566;
        Mon, 25 Mar 2019 23:42:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553582534; cv=none;
        d=google.com; s=arc-20160816;
        b=QV19FVWiWWVNh0d3+ma02YWnJSEmWjorWxiwJAKVwq54t4gejanOfCCymJmVK7iPuN
         ka76XYJEME1fM2yr1Omy0cygDkAQUolZsssOuKNMN8uZnJjLmmD+CiRJtJYIbRHBkLvD
         KFteh7skRua4c8oAGWAEBfQnyzwU6UTpC4WDFxUBUbjNNWdxE0GqjKcH5AK6fQyNAes/
         nag6pEjGCGjoMCBMLevyDrI1Nb7sy9dInvV3pw8ZpsfRiDSe+NJjdJwH5+tF4WIgiOfW
         rruu5XNfXXul23UshPvb9pkMxkIVgY1U6qPSwaFqMD40GJBfGB1zhaWw854P8R+fQ9NU
         f21Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=Opnu0to6439iHv3igA2zyCDdO1CP/gHwEyd0N+mgh1U=;
        b=ZlBeJREpPFjMb101wC4mRoDxIJa5EfcoZVM5aJDIa3vdaZTxCyz4oNSPmsBAeF31Nq
         MrFHZnFARN8rgCju9fJnB63hE/iqrpGZQV1PHALZgFPgJhjEAwEi2Nqv01DsvE8Hf08I
         eUqvOW0dYaLHXRDpxZXPuokzuiI09aqFsd8ClZ5h0io4hcPFkLfEFsAn4CmbGwY26V4J
         GzJmoSEirrLDd8JT9q3UBa1cBTHJJdGBsSCy9wicNyPqLnEqfnHJuKp2YR21CkeZ8URS
         JWH3WkjzaEXx0X99SJpwYmDLtPwa3MHmnZA+i++Hy4OKKi5ZbGecjwLN0H7GnyBh0B1Z
         3ruQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id n1si15795157plp.26.2019.03.25.23.42.13
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Mar 2019 23:42:14 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73A826E78C;
	Tue, 26 Mar 2019 06:42:13 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49D9D6E78C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 26 Mar 2019 06:42:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Mar 2019 23:42:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,271,1549958400"; d="scan'208";a="125891067"
Received: from test-optiplex-7040.bj.intel.com ([10.238.154.166])
 by orsmga007.jf.intel.com with ESMTP; 25 Mar 2019 23:42:09 -0700
From: Xiong Zhang <xiong.y.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v3] drm/i915/gvt: Change fb_info->size from pages to bytes
Date: Tue, 26 Mar 2019 14:45:28 +0800
Message-Id: <1553582728-3354-1-git-send-email-xiong.y.zhang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <0190326033225.GD10798@zhen-hp.sh.intel.com>
References: <0190326033225.GD10798@zhen-hp.sh.intel.com>
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

ZmJfaW5mby0+c2l6ZSBpcyBpbiBwYWdlcywgYnV0IHNvbWUgZnVuY3Rpb24gbmVlZCBieXRlcyB3
aGVuIGl0CmlzIGEgcGFyYW1ldGVyLiBTdWNoIGFzOgphLiBpbnRlbF9ndnRfZ2d0dF92YWxpZGF0
ZV9yYW5nZSgpIGFjY29yZGluZyB0byBmdW5jdGlvbiBkZWZpbml0aW9uCmIuIHZmaW9fZGV2aWNl
X2dmeF9wbGFuZV9pbmZvLT5zaXplIGFjY29yZGluZyB0byB0aGUgY29tbWVudCBvZgogICBpdHMg
ZGVmaW5pdGlvbgoKVGhpcyBwYXRjaCBjaGFuZ2UgZmJfaW5mby0+c2l6ZSBpbnRvIGJ5dGVzLgoK
djI6IEtlZXAgZmJfaW5mby0+c2l6ZSBpbiByZWFsIHNpemUgaW5zdGVhZCBvZiBhc3NpZ25pbmcg
Y2FzdGVkCiAgICBwYWdlIHNpemUoemhlbnl1KQp2Mzogb2JqLT5zaXplIHNob3VsZCBiZSBwYWdl
IGFsaWduZWQgYW5kIGRlbGV0ZSByZWR1bmRhbnQgY2hlY2soemhlbnl1KQoKU2lnbmVkLW9mZi1i
eTogWGlvbmcgWmhhbmcgPHhpb25nLnkuemhhbmdAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2d2dC9kbWFidWYuYyB8IDE3ICsrKysrKy0tLS0tLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgNiBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZG1hYnVmLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
ZG1hYnVmLmMKaW5kZXggNWQ4ODdmNy4uZmYyOTIxYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3Z0L2RtYWJ1Zi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kbWFi
dWYuYwpAQCAtNDUsNiArNDUsNyBAQCBzdGF0aWMgaW50IHZncHVfZ2VtX2dldF9wYWdlcygKIAlp
bnQgaSwgcmV0OwogCWdlbjhfcHRlX3QgX19pb21lbSAqZ3R0X2VudHJpZXM7CiAJc3RydWN0IGlu
dGVsX3ZncHVfZmJfaW5mbyAqZmJfaW5mbzsKKwl1MzIgcGFnZV9udW07CiAKIAlmYl9pbmZvID0g
KHN0cnVjdCBpbnRlbF92Z3B1X2ZiX2luZm8gKilvYmotPmd2dF9pbmZvOwogCWlmIChXQVJOX09O
KCFmYl9pbmZvKSkKQEAgLTU0LDE0ICs1NSwxNSBAQCBzdGF0aWMgaW50IHZncHVfZ2VtX2dldF9w
YWdlcygKIAlpZiAodW5saWtlbHkoIXN0KSkKIAkJcmV0dXJuIC1FTk9NRU07CiAKLQlyZXQgPSBz
Z19hbGxvY190YWJsZShzdCwgZmJfaW5mby0+c2l6ZSwgR0ZQX0tFUk5FTCk7CisJcGFnZV9udW0g
PSBvYmotPmJhc2Uuc2l6ZSA+PiBQQUdFX1NISUZUOworCXJldCA9IHNnX2FsbG9jX3RhYmxlKHN0
LCBwYWdlX251bSwgR0ZQX0tFUk5FTCk7CiAJaWYgKHJldCkgewogCQlrZnJlZShzdCk7CiAJCXJl
dHVybiByZXQ7CiAJfQogCWd0dF9lbnRyaWVzID0gKGdlbjhfcHRlX3QgX19pb21lbSAqKWRldl9w
cml2LT5nZ3R0LmdzbSArCiAJCShmYl9pbmZvLT5zdGFydCA+PiBQQUdFX1NISUZUKTsKLQlmb3Jf
ZWFjaF9zZyhzdC0+c2dsLCBzZywgZmJfaW5mby0+c2l6ZSwgaSkgeworCWZvcl9lYWNoX3NnKHN0
LT5zZ2wsIHNnLCBwYWdlX251bSwgaSkgewogCQlzZy0+b2Zmc2V0ID0gMDsKIAkJc2ctPmxlbmd0
aCA9IFBBR0VfU0laRTsKIAkJc2dfZG1hX2FkZHJlc3Moc2cpID0KQEAgLTE1OCw3ICsxNjAsNyBA
QCBzdGF0aWMgc3RydWN0IGRybV9pOTE1X2dlbV9vYmplY3QgKnZncHVfY3JlYXRlX2dlbShzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2LAogCQlyZXR1cm4gTlVMTDsKIAogCWRybV9nZW1fcHJpdmF0ZV9v
YmplY3RfaW5pdChkZXYsICZvYmotPmJhc2UsCi0JCWluZm8tPnNpemUgPDwgUEFHRV9TSElGVCk7
CisJCQkJICAgIHJvdW5kdXAoaW5mby0+c2l6ZSwgUEFHRV9TSVpFKSk7CiAJaTkxNV9nZW1fb2Jq
ZWN0X2luaXQob2JqLCAmaW50ZWxfdmdwdV9nZW1fb3BzKTsKIAogCW9iai0+cmVhZF9kb21haW5z
ID0gSTkxNV9HRU1fRE9NQUlOX0dUVDsKQEAgLTIwNiw3ICsyMDgsNiBAQCBzdGF0aWMgaW50IHZn
cHVfZ2V0X3BsYW5lX2luZm8oc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAkJc3RydWN0IGludGVs
X3ZncHVfZmJfaW5mbyAqaW5mbywKIAkJaW50IHBsYW5lX2lkKQogewotCXN0cnVjdCBkcm1faTkx
NV9wcml2YXRlICpkZXZfcHJpdiA9IHRvX2k5MTUoZGV2KTsKIAlzdHJ1Y3QgaW50ZWxfdmdwdV9w
cmltYXJ5X3BsYW5lX2Zvcm1hdCBwOwogCXN0cnVjdCBpbnRlbF92Z3B1X2N1cnNvcl9wbGFuZV9m
b3JtYXQgYzsKIAlpbnQgcmV0OwpAQCAtMjY0LDggKzI2NSw3IEBAIHN0YXRpYyBpbnQgdmdwdV9n
ZXRfcGxhbmVfaW5mbyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCQlyZXR1cm4gLUVJTlZBTDsK
IAl9CiAKLQlpbmZvLT5zaXplID0gKGluZm8tPnN0cmlkZSAqIGluZm8tPmhlaWdodCArIFBBR0Vf
U0laRSAtIDEpCi0JCSAgICAgID4+IFBBR0VfU0hJRlQ7CisJaW5mby0+c2l6ZSA9IGluZm8tPnN0
cmlkZSAqIGluZm8tPmhlaWdodDsKIAlpZiAoaW5mby0+c2l6ZSA9PSAwKSB7CiAJCWd2dF92Z3B1
X2VycigiZmIgc2l6ZSBpcyB6ZXJvXG4iKTsKIAkJcmV0dXJuIC1FSU5WQUw7CkBAIC0yNzUsMTEg
KzI3NSw2IEBAIHN0YXRpYyBpbnQgdmdwdV9nZXRfcGxhbmVfaW5mbyhzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2LAogCQlndnRfdmdwdV9lcnIoIk5vdCBhbGlnbmVkIGZiIGFkZHJlc3M6MHglbGx4XG4i
LCBpbmZvLT5zdGFydCk7CiAJCXJldHVybiAtRUZBVUxUOwogCX0KLQlpZiAoKChpbmZvLT5zdGFy
dCA+PiBQQUdFX1NISUZUKSArIGluZm8tPnNpemUpID4KLQkJZ2d0dF90b3RhbF9lbnRyaWVzKCZk
ZXZfcHJpdi0+Z2d0dCkpIHsKLQkJZ3Z0X3ZncHVfZXJyKCJJbnZhbGlkIEdUVCBvZmZzZXQgb3Ig
c2l6ZVxuIik7Ci0JCXJldHVybiAtRUZBVUxUOwotCX0KIAogCWlmICghaW50ZWxfZ3Z0X2dndHRf
dmFsaWRhdGVfcmFuZ2UodmdwdSwgaW5mby0+c3RhcnQsIGluZm8tPnNpemUpKSB7CiAJCWd2dF92
Z3B1X2VycigiaW52YWxpZCBnbWEgYWRkclxuIik7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxp
c3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
