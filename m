Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp2786891ywd;
        Sun, 27 Jan 2019 19:18:31 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5xLwaZram2h2c+p87VoTQTAGJHmFq1iuZEnoGvOH8Vn+c/TdTeLNZfugf9QzGxfPYypHJA
X-Received: by 2002:a63:2f86:: with SMTP id v128mr17759799pgv.407.1548645511193;
        Sun, 27 Jan 2019 19:18:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548645511; cv=none;
        d=google.com; s=arc-20160816;
        b=iwRGiqqp2yFUSjOhP8jCdT5jiBvtJbQPW4m5j3CT5yk0pU1vyujMotTWCyWFCjhQxN
         rNeih7JeXMND5XrNn28uYmIzGiusTvnEmuioqyeF1fX/IlLE2bdhuvhFRltLm169ynqC
         e2UzQkpcpN9/dzQSKKFwwtsVr8gmHvum1zBpGXZaGjzGr8tSQ8RM04SSr58e+TEETwye
         UlDD509nCc2azTzOezJlUAUWhnN4hndDuVB3Bg3uLwEx+eIf27VrJ3IlqetT8G26fosU
         PSIkCOre7x1WLQd0Ysdx3F1yDtW7ETx1j4/tlwEEutqRYvBhigZ5HH7AK3Vx7gO2CIou
         oGJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:message-id:date:subject:to:from:delivered-to;
        bh=+hvuWrx9WK0lTg4pKYASGZtIYGkc8DuRUJ9bYeB1GQw=;
        b=w4P1tqFpb3ZtosApfWrXBVxSfqTWQRXAoSkQDdLMn7fiQgDBVDg9Pm3Bd2CgeyjI5p
         vAaLIyQqrlhETU9Hamt9LLc0bMCObFxv52X2e6NyjOLFXUyZwCfUNw/U/QW66HVcDtvm
         bXmod5YnwcxY+x4Obzl4uAxkDUUBSJFI/lKI/hLOQFdcyYRb2ohXVmk3jDRmszyXsYWN
         H8Jac1uKdgmKvpc+Si1eGkcT4g8m4DoV+FzTAxPRMoyBgjyQPNgYMMaD2wWvB2NzJF4/
         ARNeYyautECCxnTMT9LNthgW3ZskLU5Lqfsjdp+PyIkgFW+dSjxlbJr+xDY9jQAORZgY
         WFVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id r138si32756732pgr.58.2019.01.27.19.18.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 27 Jan 2019 19:18:31 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49ED36E38A;
	Mon, 28 Jan 2019 03:18:30 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 460C66E389
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 28 Jan 2019 02:46:05 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Jan 2019 18:46:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,532,1539673200"; d="scan'208";a="129374135"
Received: from shbuild999.sh.intel.com ([10.239.147.118])
 by orsmga002.jf.intel.com with ESMTP; 27 Jan 2019 18:46:02 -0800
From: Feng Tang <feng.tang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Xiao Zheng <xiao.zheng@intel.com>,
 Min He <min.he@intel.com>, Bing Niu <bing.niu@intel.com>
Subject: [RFC PATCH] drm/i915/gvt: Try cma allocation first for oos page setup
Date: Mon, 28 Jan 2019 10:46:20 +0800
Message-Id: <1548643580-91046-1-git-send-email-feng.tang@intel.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Mon, 28 Jan 2019 03:18:29 +0000
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
Cc: Feng Tang <feng.tang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

V2hlbiBkb2luZyBib290dGltZSBwcm9maWxpbmcsIHdlIGZvdW5kIHRoZSBvb3MgcGFnZSBzZXR1
cCB0YWtlcyBhYm91dAoyNX4zMCBtcywgd2hpbGUgdXNpbmcgY21hIGFsbG9jYXRpb24gdGFrZXMg
bGVzcyB0aGFuIDEwIG1zLiBBbmQgaWYgdGhlCnByZWFsbG9jYXRlZF9vb3NfcGFnZXMgaW5jcmVh
c2VzIGluIGZ1dHVyZSwgaXQgd2lsbCBzYXZlIG1vcmUuCgpUaGlzIGNvbW1pdCB3aWxsIHRyeSB0
byBhbGxvY2F0ZSB0aGUgbWVtb3J5IGZyb20gQ01BIGZpcnN0LCBhbmQgZmFsbApiYWNrIHRvIHRo
ZSBvcmlnaW5hbCBremFsbG9jIGlmIENNQSBpcyBub3QgYXZhaWxhYmxlLgoKU2lnbmVkLW9mZi1i
eTogRmVuZyBUYW5nIDxmZW5nLnRhbmdAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2d2dC9ndHQuYyB8IDI2ICsrKysrKysrKysrKysrKysrKysrKy0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0
LmMKaW5kZXggYzcxMDNkZC4uZThkNmYxMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3Z0L2d0dC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYwpAQCAtMjQ5
NiwxOCArMjQ5NiwzNCBAQCBzdGF0aWMgdm9pZCBjbGVhbl9zcHRfb29zKHN0cnVjdCBpbnRlbF9n
dnQgKmd2dCkKIHN0YXRpYyBpbnQgc2V0dXBfc3B0X29vcyhzdHJ1Y3QgaW50ZWxfZ3Z0ICpndnQp
CiB7CiAJc3RydWN0IGludGVsX2d2dF9ndHQgKmd0dCA9ICZndnQtPmd0dDsKLQlzdHJ1Y3QgaW50
ZWxfdmdwdV9vb3NfcGFnZSAqb29zX3BhZ2U7CisJc3RydWN0IGludGVsX3ZncHVfb29zX3BhZ2Ug
Km9vc19wYWdlLCAqb29zX3BhZ2VfYmFzZTsKKwlzdHJ1Y3QgcGFnZSAqY21hX3BhZ2U7CisJaW50
IG5wYWdlczsKIAlpbnQgaTsKIAlpbnQgcmV0OwogCiAJSU5JVF9MSVNUX0hFQUQoJmd0dC0+b29z
X3BhZ2VfZnJlZV9saXN0X2hlYWQpOwogCUlOSVRfTElTVF9IRUFEKCZndHQtPm9vc19wYWdlX3Vz
ZV9saXN0X2hlYWQpOwogCisJLyogVHJ5IGNtYSBhbGxvY2F0aW9uIGZpcnN0IHRvIHNhdmUgc2V0
dXAgdGltZSAqLworCW5wYWdlcyA9IHByZWFsbG9jYXRlZF9vb3NfcGFnZXMgKiBzaXplb2YoKm9v
c19wYWdlKTsKKwlucGFnZXMgPSBESVZfUk9VTkRfVVAobnBhZ2VzLCBQQUdFX1NJWkUpOworCisJ
Y21hX3BhZ2UgPSBkbWFfYWxsb2NfZnJvbV9jb250aWd1b3VzKE5VTEwsIG5wYWdlcywgMSwgVFJV
RSk7CisJaWYgKGNtYV9wYWdlKSB7CisJCW9vc19wYWdlX2Jhc2UgPSBwYWdlX2FkZHJlc3MoY21h
X3BhZ2UpOworCQltZW1zZXQob29zX3BhZ2VfYmFzZSwgMCwgbnBhZ2VzIDw8IFBBR0VfU0hJRlQp
OworCX0KKwogCWZvciAoaSA9IDA7IGkgPCBwcmVhbGxvY2F0ZWRfb29zX3BhZ2VzOyBpKyspIHsK
LQkJb29zX3BhZ2UgPSBremFsbG9jKHNpemVvZigqb29zX3BhZ2UpLCBHRlBfS0VSTkVMKTsKLQkJ
aWYgKCFvb3NfcGFnZSkgewotCQkJcmV0ID0gLUVOT01FTTsKLQkJCWdvdG8gZmFpbDsKKwkJaWYg
KGNtYV9wYWdlKSB7CisJCQlvb3NfcGFnZSA9IG9vc19wYWdlX2Jhc2UgKyBpOworCQl9IGVsc2Ug
eworCQkJb29zX3BhZ2UgPSBremFsbG9jKHNpemVvZigqb29zX3BhZ2UpLCBHRlBfS0VSTkVMKTsK
KwkJCWlmICghb29zX3BhZ2UpIHsKKwkJCQlyZXQgPSAtRU5PTUVNOworCQkJCWdvdG8gZmFpbDsK
KwkJCX0KIAkJfQogCiAJCUlOSVRfTElTVF9IRUFEKCZvb3NfcGFnZS0+bGlzdCk7Ci0tIAoyLjcu
NAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwt
Z3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQt
ZGV2Cg==
