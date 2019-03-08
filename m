Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp7701100ywe;
        Thu, 7 Mar 2019 23:18:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqwb0lG+fPNpcF+CixxdDuA5tVeABRsfUH+dZGapUL6aA4cvLfpB2QnI86dOiiaNu1pYN0LX
X-Received: by 2002:aa7:8a0a:: with SMTP id m10mr16890843pfa.129.1552029480836;
        Thu, 07 Mar 2019 23:18:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552029480; cv=none;
        d=google.com; s=arc-20160816;
        b=X3us0eACJRxJpJ4fkuYSh4RzMQdJjD0BemZ1dGt3gkNWJ9hT7yKDnO/653Vvw9Mu5q
         2yZ787ljI1qZhsUnKVBaKhqOh1nIiPN9q+JCMhLF6c87CpvrwjbQbkas9C4v2wucmT/A
         tvx/o8h6t61hR3L9pEjMjmhwzUIvABbNOluNqjjmaoTTLaSCLihXuuLijDJpZkvGJrva
         /h2YTg1R5uboarL3anJuzOgYuyjAGsI1rId044q75pCr5kHK5YvJxdp76TvSl3f39uR6
         UXoQFGCbyXVe8m80AgplLniDg/Pt0npx9EuRPLUJGgilcsCQWElohQsbT4KdYXEAf9Gf
         KQiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:message-id:date:subject:to:from:delivered-to;
        bh=lVdl5OOgpDmo4c47LchpAZsKr071p7ndnQpSu6qIlW8=;
        b=cCEvz+xnBP2Js9wlta7NoMnCizeCiYi6AztGv0Fj1WL23EZBxiznn9V+0GdL8a6ydK
         YX9Ad805s08fQdbF1PRzIF2ok3wNTfRGJ1a6KQFps8cVNA5rD6A76isU6Bkn9PuHTH4q
         cdFkDEmy31N5VWAL8vJ/C+xzUMn5fpH3K3nO6eFk3g4OoPQHmulGHtO77M+8i7T+RE1o
         zsguclN4lUG7ZbmH7KNCJm7FvFZE9jRvnGhfyCX7+fyZwtx6dE47l2O4T5pZNyFhMMCA
         8E36cDCzQ3/FBWAoKDeElocmG7MXUPzArJOXylyagg7+rhHwPji0q123UCUEhEujeHZz
         sReQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id p10si6075644pls.296.2019.03.07.23.18.00
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Mar 2019 23:18:00 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F38AC6E2A7;
	Fri,  8 Mar 2019 07:17:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E946E297
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  8 Mar 2019 07:17:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Mar 2019 23:17:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,455,1544515200"; d="scan'208";a="132564039"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.9])
 by fmsmga007.fm.intel.com with ESMTP; 07 Mar 2019 23:17:57 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: remove the unused sreg
Date: Fri,  8 Mar 2019 02:12:20 -0500
Message-Id: <20190308071220.20202-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
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

Y29kZSBjbGVhbnVwLiBzcmVnIGlzIG5vdCB1c2VkIG5vdy4gcmVtb3ZlIGl0IGZvciBjb2RlIGNs
ZWFubmVzcy4KClNpZ25lZC1vZmYtYnk6IFlhbiBaaGFvIDx5YW4ueS56aGFvQGludGVsLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3Z0LmggICAgICB8IDUgLS0tLS0KIGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC9oYW5kbGVycy5jIHwgNSArLS0tLQogZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Z0L21taW8uYyAgICAgfCA2ICstLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2d2dC9ndnQuaCBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndnQuaAppbmRleCBlZjcx
MGUyNTk3MjYuLmE0ZmQ5NzliM2RhZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z3Z0L2d2dC5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndnQuaApAQCAtOTQsNyAr
OTQsNiBAQCBzdHJ1Y3QgaW50ZWxfdmdwdV9mZW5jZSB7CiAKIHN0cnVjdCBpbnRlbF92Z3B1X21t
aW8gewogCXZvaWQgKnZyZWc7Ci0Jdm9pZCAqc3JlZzsKIH07CiAKICNkZWZpbmUgSU5URUxfR1ZU
X01BWF9CQVJfTlVNIDQKQEAgLTQ0NywxMCArNDQ2LDYgQEAgdm9pZCBpbnRlbF92Z3B1X3dyaXRl
X2ZlbmNlKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LAogCSgqKHU2NCAqKSh2Z3B1LT5tbWlvLnZy
ZWcgKyBpOTE1X21taW9fcmVnX29mZnNldChyZWcpKSkKICNkZWZpbmUgdmdwdV92cmVnNjQodmdw
dSwgb2Zmc2V0KSBcCiAJKCoodTY0ICopKHZncHUtPm1taW8udnJlZyArIChvZmZzZXQpKSkKLSNk
ZWZpbmUgdmdwdV9zcmVnX3QodmdwdSwgcmVnKSBcCi0JKCoodTMyICopKHZncHUtPm1taW8uc3Jl
ZyArIGk5MTVfbW1pb19yZWdfb2Zmc2V0KHJlZykpKQotI2RlZmluZSB2Z3B1X3NyZWcodmdwdSwg
b2Zmc2V0KSBcCi0JKCoodTMyICopKHZncHUtPm1taW8uc3JlZyArIChvZmZzZXQpKSkKIAogI2Rl
ZmluZSBmb3JfZWFjaF9hY3RpdmVfdmdwdShndnQsIHZncHUsIGlkKSBcCiAJaWRyX2Zvcl9lYWNo
X2VudHJ5KCgmKGd2dCktPnZncHVfaWRyKSwgKHZncHUpLCAoaWQpKSBcCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC9oYW5kbGVycy5jCmluZGV4IGI1YzBhYzA0OTI1Zi4uNTRiZDBiMDMzMjk4IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYwpAQCAtMzQ4OSwxMiArMzQ4OSwxMSBAQCBpbnQgaW50
ZWxfdmdwdV9tbWlvX3JlZ19ydyhzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwgdW5zaWduZWQgaW50
IG9mZnNldCwKIAkJcmV0dXJuIG1taW9faW5mby0+cmVhZCh2Z3B1LCBvZmZzZXQsIHBkYXRhLCBi
eXRlcyk7CiAJZWxzZSB7CiAJCXU2NCByb19tYXNrID0gbW1pb19pbmZvLT5yb19tYXNrOwotCQl1
MzIgb2xkX3ZyZWcgPSAwLCBvbGRfc3JlZyA9IDA7CisJCXUzMiBvbGRfdnJlZyA9IDA7CiAJCXU2
NCBkYXRhID0gMDsKIAogCQlpZiAoaW50ZWxfZ3Z0X21taW9faGFzX21vZGVfbWFzayhndnQsIG1t
aW9faW5mby0+b2Zmc2V0KSkgewogCQkJb2xkX3ZyZWcgPSB2Z3B1X3ZyZWcodmdwdSwgb2Zmc2V0
KTsKLQkJCW9sZF9zcmVnID0gdmdwdV9zcmVnKHZncHUsIG9mZnNldCk7CiAJCX0KIAogCQlpZiAo
bGlrZWx5KCFyb19tYXNrKSkKQEAgLTM1MTYsOCArMzUxNSw2IEBAIGludCBpbnRlbF92Z3B1X21t
aW9fcmVnX3J3KHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LCB1bnNpZ25lZCBpbnQgb2Zmc2V0LAog
CiAJCQl2Z3B1X3ZyZWcodmdwdSwgb2Zmc2V0KSA9IChvbGRfdnJlZyAmIH5tYXNrKQogCQkJCQl8
ICh2Z3B1X3ZyZWcodmdwdSwgb2Zmc2V0KSAmIG1hc2spOwotCQkJdmdwdV9zcmVnKHZncHUsIG9m
ZnNldCkgPSAob2xkX3NyZWcgJiB+bWFzaykKLQkJCQkJfCAodmdwdV9zcmVnKHZncHUsIG9mZnNl
dCkgJiBtYXNrKTsKIAkJfQogCX0KIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z3Z0L21taW8uYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9tbWlvLmMKaW5kZXggZWQ0ZGYy
ZjZkNjBiLi4yNzFhY2NkNjg2NTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2
dC9tbWlvLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21taW8uYwpAQCAtMjM5LDcg
KzIzOSw2IEBAIHZvaWQgaW50ZWxfdmdwdV9yZXNldF9tbWlvKHN0cnVjdCBpbnRlbF92Z3B1ICp2
Z3B1LCBib29sIGRtbHIpCiAKIAlpZiAoZG1scikgewogCQltZW1jcHkodmdwdS0+bW1pby52cmVn
LCBtbWlvLCBpbmZvLT5tbWlvX3NpemUpOwotCQltZW1jcHkodmdwdS0+bW1pby5zcmVnLCBtbWlv
LCBpbmZvLT5tbWlvX3NpemUpOwogCiAJCXZncHVfdnJlZ190KHZncHUsIEdFTjZfR1RfVEhSRUFE
X1NUQVRVU19SRUcpID0gMDsKIApAQCAtMjgwLDcgKzI3OSw2IEBAIHZvaWQgaW50ZWxfdmdwdV9y
ZXNldF9tbWlvKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LCBib29sIGRtbHIpCiAJCSAqIHRvdWNo
ZWQKIAkJICovCiAJCW1lbWNweSh2Z3B1LT5tbWlvLnZyZWcsIG1taW8sIEdWVF9HRU44X01NSU9f
UkVTRVRfT0ZGU0VUKTsKLQkJbWVtY3B5KHZncHUtPm1taW8uc3JlZywgbW1pbywgR1ZUX0dFTjhf
TU1JT19SRVNFVF9PRkZTRVQpOwogCX0KIAogfQpAQCAtMzAwLDggKzI5OCw2IEBAIGludCBpbnRl
bF92Z3B1X2luaXRfbW1pbyhzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSkKIAlpZiAoIXZncHUtPm1t
aW8udnJlZykKIAkJcmV0dXJuIC1FTk9NRU07CiAKLQl2Z3B1LT5tbWlvLnNyZWcgPSB2Z3B1LT5t
bWlvLnZyZWcgKyBpbmZvLT5tbWlvX3NpemU7Ci0KIAlpbnRlbF92Z3B1X3Jlc2V0X21taW8odmdw
dSwgdHJ1ZSk7CiAKIAlyZXR1cm4gMDsKQEAgLTMxNSw1ICszMTEsNSBAQCBpbnQgaW50ZWxfdmdw
dV9pbml0X21taW8oc3RydWN0IGludGVsX3ZncHUgKnZncHUpCiB2b2lkIGludGVsX3ZncHVfY2xl
YW5fbW1pbyhzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSkKIHsKIAl2ZnJlZSh2Z3B1LT5tbWlvLnZy
ZWcpOwotCXZncHUtPm1taW8udnJlZyA9IHZncHUtPm1taW8uc3JlZyA9IE5VTEw7CisJdmdwdS0+
bW1pby52cmVnID0gTlVMTDsKIH0KLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwt
Z3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
