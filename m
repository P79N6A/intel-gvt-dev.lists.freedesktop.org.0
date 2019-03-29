Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5710:0:0:0:0:0 with SMTP id l16csp1378475ywb;
        Thu, 28 Mar 2019 21:01:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxbROwnnzj4a/U3uHiZa5h0P00yVlL/5kSt564OCZkzWPXj65Lils9pFTpJ33+mEByOuvff
X-Received: by 2002:a17:902:7441:: with SMTP id e1mr12927541plt.13.1553832076233;
        Thu, 28 Mar 2019 21:01:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553832076; cv=none;
        d=google.com; s=arc-20160816;
        b=nagUkzp1VzWx7ga7khevMH4ULncmxS71b9SeGeGQ28yWlGjvMeCo60NXwrd6zvdlcF
         NbqzZ3TtWhGYjZyGjuQenTcwkAXLCGMSjkYi2AQkmH1XDCQ1JmgLMBmIO5PrfP6fO/Qg
         NYWElFs4gMgnit3YeSBFuR+jZfIVtX+Eqvd3j/zau0j7OjAhcq/v5JicGwFFWZQpVxgs
         1pHkwNRIfHOp/kGXUCocUFXO4cMRWA5EsOnjsOZFsrCvPHSL+bJXQH8ScMJic+TbI2er
         FF//ncN5VyYOHlQNLaC6iZJ9cpsFPF0/DykTgJiCWzhd4OZGg8VA4xVEvwERpvjI0lWh
         E3jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=bzUqGWNOHZQwzFNl+ZuFdPHvNx7DlVXm2agf2X8L06o=;
        b=obyWmA2hwc4rdekVeGbZaWSJ1F8uHM5vShQIIodWQRcDCFPhZQ8UuPMv4SVGGUqUrJ
         eOiWDKalM0fBuEGG2GG1AAr0pbbI0n30WMQu+6uezy4IeRnnk/0YMH0QI5GlHYKriA28
         RKo6iT4noDr/vj+cjbiAFSpVxfcvJIZjakes5eSG03kEPc1Df8wsiQc6J4T2LpDuKjrq
         DRz1pzGvKQCWMYAhRfGFID0/WhUFzG0PDD4nM/TF24DqZGZTuExMX2rAF64DDFG1we7w
         88t/U8S+Q0QvbJL1XUTxkzaPfVh73p/Q3Lc1YN6bftssRTpWmNEGEWpcsjmyUaln1ZOL
         n0Vw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id 70si878310pfu.227.2019.03.28.21.01.16
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Mar 2019 21:01:16 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD2106E81C;
	Fri, 29 Mar 2019 04:01:15 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E25C76E81C;
 Fri, 29 Mar 2019 04:01:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Mar 2019 21:01:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,283,1549958400"; d="scan'208";a="129648549"
Received: from vca-bj120.bj.intel.com ([10.240.192.119])
 by orsmga008.jf.intel.com with ESMTP; 28 Mar 2019 21:01:12 -0700
From: Xiaolin Zhang <xiaolin.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 5/8] drm/i915/gvt: GVTg handle pv_caps PVINFO register
Date: Fri, 29 Mar 2019 09:32:41 -0400
Message-Id: <1553866364-111114-6-git-send-email-xiaolin.zhang@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1553866364-111114-1-git-send-email-xiaolin.zhang@intel.com>
References: <1553866364-111114-1-git-send-email-xiaolin.zhang@intel.com>
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
Cc: Xiaolin Zhang <xiaolin.zhang@intel.com>, zhenyu.z.wang@intel.com,
 joonas.lahtinen@linux.intel.com, hang.yuan@intel.com, min.he@intel.com,
 zhiyuan.lv@intel.com, chris@chris-wilson.co.uk, zhi.a.wang@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

aW1wbGVtZW50IHB2X2NhcHMgUFZJTkZPIHJlZ2lzdGVyIGhhbmRsZXIgaW4gR1ZUZyB0bwpjb250
cm9sIGRpZmZlcmVudCBsZXZlbCBwdiBvcHRpbWl6YXRpb24gd2l0aGluIGd1ZXN0LgoKcmVwb3J0
IFZHVF9DQVBTX1BWIGNhcGFiaWxpdHkgaW4gcHZpbmZvIHBhZ2UgZm9yIGd1ZXN0LgoKdjA6IFJG
Qwp2MTogcmViYXNlCnYyOiByZWJhc2UKdjM6IHJlbmFtZWQgZW5hYmxlX3B2bW1pbyB0byBwdm1t
aW9fY2FwcyB3aGljaCBpcyB1c2VkIGZvciBob3N0CnB2IGNhcHMuCnY0OiByZW5hbWVkIHB2bW1p
b19jYXBzIHRvIHB2X2NhcHMKClNpZ25lZC1vZmYtYnk6IFhpYW9saW4gWmhhbmcgPHhpYW9saW4u
emhhbmdAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9oYW5kbGVycy5j
IHwgNCArKysrCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvdmdwdS5jICAgICB8IDMgKysrCiAy
IGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d2dC9oYW5kbGVycy5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRs
ZXJzLmMKaW5kZXggNjM0MThjOC4uMDMzMzY1MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Z0L2hhbmRsZXJzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRs
ZXJzLmMKQEAgLTExNjcsNiArMTE2Nyw3IEBAIHN0YXRpYyBpbnQgcHZpbmZvX21taW9fcmVhZChz
dHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwgdW5zaWduZWQgaW50IG9mZnNldCwKIAkJYnJlYWs7CiAJ
Y2FzZSAweDc4MDEwOgkvKiB2Z3RfY2FwcyAqLwogCWNhc2UgMHg3ODgxYzoKKwljYXNlIF92Z3Rp
Zl9yZWcocHZfY2Fwcyk6CiAJCWJyZWFrOwogCWRlZmF1bHQ6CiAJCWludmFsaWRfcmVhZCA9IHRy
dWU7CkBAIC0xMjQwLDYgKzEyNDEsOSBAQCBzdGF0aWMgaW50IHB2aW5mb19tbWlvX3dyaXRlKHN0
cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LCB1bnNpZ25lZCBpbnQgb2Zmc2V0LAogCWNhc2UgX3ZndGlm
X3JlZyhnMnZfbm90aWZ5KToKIAkJcmV0ID0gaGFuZGxlX2cydl9ub3RpZmljYXRpb24odmdwdSwg
ZGF0YSk7CiAJCWJyZWFrOworCWNhc2UgX3ZndGlmX3JlZyhwdl9jYXBzKToKKwkJRFJNX0lORk8o
InZncHUgaWQ9JWQgcHYgY2FwcyA9MHgleFxuIiwgdmdwdS0+aWQsIGRhdGEpOworCQlicmVhazsK
IAkvKiBhZGQgeGhvdCBhbmQgeWhvdCB0byBoYW5kbGVkIGxpc3QgdG8gYXZvaWQgZXJyb3IgbG9n
ICovCiAJY2FzZSBfdmd0aWZfcmVnKGN1cnNvcl94X2hvdCk6CiAJY2FzZSBfdmd0aWZfcmVnKGN1
cnNvcl95X2hvdCk6CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvdmdwdS5j
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3ZncHUuYwppbmRleCAzMTRlNDAxLi45YzlhMTky
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvdmdwdS5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC92Z3B1LmMKQEAgLTQ3LDYgKzQ3LDcgQEAgdm9pZCBwb3B1bGF0
ZV9wdmluZm9fcGFnZShzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSkKIAl2Z3B1X3ZyZWdfdCh2Z3B1
LCB2Z3RpZl9yZWcodmd0X2NhcHMpKSA9IFZHVF9DQVBTX0ZVTExfUFBHVFQ7CiAJdmdwdV92cmVn
X3QodmdwdSwgdmd0aWZfcmVnKHZndF9jYXBzKSkgfD0gVkdUX0NBUFNfSFdTUF9FTVVMQVRJT047
CiAJdmdwdV92cmVnX3QodmdwdSwgdmd0aWZfcmVnKHZndF9jYXBzKSkgfD0gVkdUX0NBUFNfSFVH
RV9HVFQ7CisJdmdwdV92cmVnX3QodmdwdSwgdmd0aWZfcmVnKHZndF9jYXBzKSkgfD0gVkdUX0NB
UFNfUFY7CiAKIAl2Z3B1X3ZyZWdfdCh2Z3B1LCB2Z3RpZl9yZWcoYXZhaWxfcnMubWFwcGFibGVf
Z21hZHIuYmFzZSkpID0KIAkJdmdwdV9hcGVydHVyZV9nbWFkcl9iYXNlKHZncHUpOwpAQCAtNTMx
LDYgKzUzMiw3IEBAIHZvaWQgaW50ZWxfZ3Z0X3Jlc2V0X3ZncHVfbG9ja2VkKHN0cnVjdCBpbnRl
bF92Z3B1ICp2Z3B1LCBib29sIGRtbHIsCiAJc3RydWN0IGludGVsX2d2dCAqZ3Z0ID0gdmdwdS0+
Z3Z0OwogCXN0cnVjdCBpbnRlbF9ndnRfd29ya2xvYWRfc2NoZWR1bGVyICpzY2hlZHVsZXIgPSAm
Z3Z0LT5zY2hlZHVsZXI7CiAJdW5zaWduZWQgaW50IHJlc2V0dGluZ19lbmcgPSBkbWxyID8gQUxM
X0VOR0lORVMgOiBlbmdpbmVfbWFzazsKKwlpbnQgcHZfY2FwcyA9IHZncHVfdnJlZ190KHZncHUs
IHZndGlmX3JlZyhwdl9jYXBzKSk7CiAKIAlndnRfZGJnX2NvcmUoIi0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLVxuIik7CiAJZ3Z0X2RiZ19jb3JlKCJyZXNzZXRpbmcg
dmdwdSVkLCBkbWxyICVkLCBlbmdpbmVfbWFzayAlMDh4XG4iLApAQCAtNTYyLDYgKzU2NCw3IEBA
IHZvaWQgaW50ZWxfZ3Z0X3Jlc2V0X3ZncHVfbG9ja2VkKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1
LCBib29sIGRtbHIsCiAKIAkJaW50ZWxfdmdwdV9yZXNldF9tbWlvKHZncHUsIGRtbHIpOwogCQlw
b3B1bGF0ZV9wdmluZm9fcGFnZSh2Z3B1KTsKKwkJdmdwdV92cmVnX3QodmdwdSwgdmd0aWZfcmVn
KHB2X2NhcHMpKSA9IHB2X2NhcHM7CiAJCWludGVsX3ZncHVfcmVzZXRfZGlzcGxheSh2Z3B1KTsK
IAogCQlpZiAoZG1scikgewotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
