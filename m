Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp7777559ywe;
        Fri, 8 Mar 2019 00:57:45 -0800 (PST)
X-Google-Smtp-Source: APXvYqyGncrzyX1/eMZX9HloETccLN5KA6BC7MFCUXqXPJiwQQWy7yRHHdoCOWWVnXMut7eINsRh
X-Received: by 2002:a63:c042:: with SMTP id z2mr15726171pgi.307.1552035464953;
        Fri, 08 Mar 2019 00:57:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552035464; cv=none;
        d=google.com; s=arc-20160816;
        b=Wftrxm9uTx+BqKiEj9bu6UGgduPPW+sSnq3ioBy08lFsTRCH+Psg5RaANv5aO9EQ3o
         ZOTmrdnL+0PnqQHaDGKR3frARkeblZE6VAhjdUef+wG08DcNUtgQBb7P9C8a6QnKWfNd
         Pu2rmrFKlbT1tvqqhxae9VtAIx71GH6DIk6JAkek2DepuTdXDXDLxsgJtSDXwy0fOMUe
         NIzhuAdSgvRjxWaaaKvcVLcOrbVSZnGSlxfwUOck9XVfpSrk58u8ZYat3CqDZXBMjVfP
         McMVJ+pUTUm8SJH4KtZs/ipAxBG6qjIXwM6oj8Bowx6JyJWZEutb+paTXRfhknRjikQj
         LdeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=h6T98V8O0jRqV06WrfTR/koHM9RPbWEhMwMAjCGZWsc=;
        b=I7WvvcKhxdga3dgxg2IYjJhLTRpG/vrI2i0Zl/ck5VodFOoM6nfDjm2iKzrI3b4NuO
         VzhKHJadLS/t9+QoZkce8/7xcsZ/bcgngca07d2dcf2jHoS5Zb4Ap8fVjp4x9VDEIsfO
         E3PZVEkKFQ7lZP0KZvbxgT9lsOIxBpqgft/vygD5dsfTSRrnHRbUWLxYHKMHhm3z/kgK
         V9pTiLzIx1qtdULxfJO/o47Hc2FJnJWUZwNCV50A9v8sZ/NKhnzsEOZf35ZeOo1uuKd4
         2jQUSb3yXCsdPsIlDluUp2TllMU+jMj2jKSewF2jdDIbN9MybahlrGuj2TRMjZB9/WwD
         1q2A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id e6si6526019pfc.201.2019.03.08.00.57.44
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Mar 2019 00:57:44 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 911EC6E2F5;
	Fri,  8 Mar 2019 08:57:44 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14DF66E2F5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  8 Mar 2019 08:57:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Mar 2019 00:57:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,455,1544515200"; d="scan'208";a="139089596"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.9])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Mar 2019 00:57:42 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v4 2/2] drm/i915/gvt: code refine of lri cmd parser
Date: Fri,  8 Mar 2019 03:52:22 -0500
Message-Id: <20190308085222.18127-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190308085122.18062-1-yan.y.zhao@intel.com>
References: <20190308085122.18062-1-yan.y.zhao@intel.com>
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
Cc: Yan Zhao <yan.y.zhao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

ZG8gbm90IGNyZWF0ZSBhIHNlcGFyYXRlIGZ1bmN0aW9uIGludGVsX3ZncHVfbWFza19tbWlvX3dy
aXRlKCkKYnV0IHVzZSBpbnRlbF92Z3B1X21taW9fcmVnX3J3KCkgZm9yIGNvbnNpc3RlbmN5LgoK
Rml4ZXM6CmNvbW1pdCA2Y2VmMjFhMTk2NDkgKCJkcm0vaTkxNS9ndnQ6IHVwZGF0ZSB2cmVnIG9u
IGluaGliaXQgY29udGV4dCBscmkKY29tbWFuZCIpCgp2NDogY2hlY2sgcmV0dXJuIHZhbHVlIG9m
IGludGVsX3ZncHVfbW1pb19yZWdfcncoKQoKU2lnbmVkLW9mZi1ieTogWWFuIFpoYW8gPHlhbi55
LnpoYW9AaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9jbWRfcGFyc2Vy
LmMgfCAxMSArKysrKy0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMg
ICB8IDI0IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDMwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2d2dC9jbWRfcGFyc2VyLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvY21kX3BhcnNl
ci5jCmluZGV4IDM1OTJkMDRjMzNiMi4uMjZhNmJmYzcwNjVjIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndnQvY21kX3BhcnNlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC9jbWRfcGFyc2VyLmMKQEAgLTkwOSwxMyArOTA5LDEyIEBAIHN0YXRpYyBpbnQgY21kX3Jl
Z19oYW5kbGVyKHN0cnVjdCBwYXJzZXJfZXhlY19zdGF0ZSAqcywKIAkJCXMtPndvcmtsb2FkLT5y
aW5nX2NvbnRleHRfZ3BhICsgMTIsICZjdHhfc3JfY3RsLCA0KTsKIAkJLyogY2hlY2sgaW5oaWJp
dCBjb250ZXh0ICovCiAJCWlmIChjdHhfc3JfY3RsICYgMSkgeworCQkJaW50IHJldCA9IDA7CiAJ
CQl1MzIgZGF0YSA9IGNtZF92YWwocywgaW5kZXggKyAxKTsKLQotCQkJaWYgKGludGVsX2d2dF9t
bWlvX2hhc19tb2RlX21hc2socy0+dmdwdS0+Z3Z0LCBvZmZzZXQpKQotCQkJCWludGVsX3ZncHVf
bWFza19tbWlvX3dyaXRlKHZncHUsCi0JCQkJCQkJb2Zmc2V0LCAmZGF0YSwgNCk7Ci0JCQllbHNl
Ci0JCQkJdmdwdV92cmVnKHZncHUsIG9mZnNldCkgPSBkYXRhOworCQkJcmV0ID0gaW50ZWxfdmdw
dV9tbWlvX3JlZ19ydyhzLT52Z3B1LCBvZmZzZXQsCisJCQkJCSZkYXRhLCA0LCBmYWxzZSk7CisJ
CQlpZiAocmV0KQorCQkJCXJldHVybiByZXQ7CiAJCX0KIAl9CiAKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC9oYW5kbGVycy5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0
L2hhbmRsZXJzLmMKaW5kZXggNTRiZDBiMDMzMjk4Li41NDUxNTRhZjkzZTkgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9oYW5kbGVycy5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d2dC9oYW5kbGVycy5jCkBAIC0zNDAxLDMwICszNDAxLDYgQEAgaW50IGludGVsX3Zn
cHVfZGVmYXVsdF9tbWlvX3dyaXRlKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LCB1bnNpZ25lZCBp
bnQgb2Zmc2V0LAogCXJldHVybiAwOwogfQogCi0vKioKLSAqIGludGVsX3ZncHVfbWFza19tbWlv
X3dyaXRlIC0gd3JpdGUgbWFzayByZWdpc3RlcgotICogQHZncHU6IGEgdkdQVQotICogQG9mZnNl
dDogYWNjZXNzIG9mZnNldAotICogQHBfZGF0YTogd3JpdGUgZGF0YSBidWZmZXIKLSAqIEBieXRl
czogYWNjZXNzIGRhdGEgbGVuZ3RoCi0gKgotICogUmV0dXJuczoKLSAqIFplcm8gb24gc3VjY2Vz
cywgbmVnYXRpdmUgZXJyb3IgY29kZSBpZiBmYWlsZWQuCi0gKi8KLWludCBpbnRlbF92Z3B1X21h
c2tfbW1pb193cml0ZShzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwgdW5zaWduZWQgaW50IG9mZnNl
dCwKLQkJdm9pZCAqcF9kYXRhLCB1bnNpZ25lZCBpbnQgYnl0ZXMpCi17Ci0JdTMyIG1hc2ssIG9s
ZF92cmVnOwotCi0Jb2xkX3ZyZWcgPSB2Z3B1X3ZyZWcodmdwdSwgb2Zmc2V0KTsKLQl3cml0ZV92
cmVnKHZncHUsIG9mZnNldCwgcF9kYXRhLCBieXRlcyk7Ci0JbWFzayA9IHZncHVfdnJlZyh2Z3B1
LCBvZmZzZXQpID4+IDE2OwotCXZncHVfdnJlZyh2Z3B1LCBvZmZzZXQpID0gKG9sZF92cmVnICYg
fm1hc2spIHwKLQkJCQkodmdwdV92cmVnKHZncHUsIG9mZnNldCkgJiBtYXNrKTsKLQotCXJldHVy
biAwOwotfQotCiAvKioKICAqIGludGVsX2d2dF9pbl9mb3JjZV9ub25wcml2X3doaXRlbGlzdCAt
IGlmIGEgbW1pbyBpcyBpbiB3aGl0ZWxpc3QgdG8gYmUKICAqIGZvcmNlLW5vcHJpdiByZWdpc3Rl
cgotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2ludGVsLWd2dC1kZXY=
