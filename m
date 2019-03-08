Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp7768695ywe;
        Fri, 8 Mar 2019 00:44:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqwp6J0gWDI8QZSw58jkUGC/L740sa/xEEUZ6jnpsVJuq1Qmadcfcvi2g3NmdI8a9V5/llqG
X-Received: by 2002:a17:902:1101:: with SMTP id d1mr17037190pla.19.1552034699584;
        Fri, 08 Mar 2019 00:44:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552034699; cv=none;
        d=google.com; s=arc-20160816;
        b=e0FlX1pUrZXpFFqvi48j9QTkCMrfLDSy09ccacnOpoztLM349NmuqAcOCZ0KbZ61Pg
         NZD0ySPVEjUz1/lQYnMQUomIedYc3T+TVRgi90pQhd5Vrc1OumllLNEpiRNJ8uSuhaZI
         n4BZzmEt1U7LxWsa2OGyjRmHCqhTaSsYpd852BR1RqbzlFBX7djG+6vtGDpyYmMLjagF
         DwJk+Ozc0V7pL+oyn0vuxRjzoYBP/s68R3HIA/Bl3zcLTmUuTHPRjXylm21rdfXpyReq
         aMNRQ9kTs8inMlanXZAghGuwOVHQ8+/GdHIqr32YdnEyBDaxql7uMhodLovKDdj1WhUY
         6U4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=2cJYtCKSF3vJg9rOGa18zNSmXjYP9uOoWpPtkd4/vBk=;
        b=KP1Qmpee5Ryzm8/KExFZWvZaJvFd2wb/zfOZigLK1vjyOzgIqvjiPOhlD/0/SnZwaQ
         qSQA5MzZFZyR4KfgcfLKWs2px2WgS9rN+b6UTg4M6fy6Grt/y0AVLnqb0iLEJQtSjUmm
         JzGecvJezyikTkm4o2Ku8C+24NQz56NBfhxwuSvuns9nb34h3gwDrC1yt1lxb+TYv14V
         CcB66r55qYrZL0O5cyGCxK1PLOJiYDlWH5Esoux/81eCCfy0p4H4T1x5Crw2eMnDZQv4
         gC3ZbCsvrPkYjChO8IUvpxK8DgaH2JtiXHxnN6xOW+N/imS6MGabY3ln7ove1YcBKk3f
         6rjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id cn6si6760700plb.242.2019.03.08.00.44.59
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Mar 2019 00:44:59 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F4066E2D9;
	Fri,  8 Mar 2019 08:44:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DC216E2D9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  8 Mar 2019 08:44:57 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Mar 2019 00:44:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,455,1544515200"; d="scan'208";a="139087439"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.9])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Mar 2019 00:44:56 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v3 2/2] drm/i915/gvt: code refine of lri cmd parser
Date: Fri,  8 Mar 2019 03:39:33 -0500
Message-Id: <20190308083933.11235-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190308083719.11125-1-yan.y.zhao@intel.com>
References: <20190308083719.11125-1-yan.y.zhao@intel.com>
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
aXRlKCkKYnV0IHVzZSBpbnRlbF92Z3B1X21taW9fcmVnX3J3IGZvciBjb25zaXN0ZW5jeS4KCkZp
eGVzOgpjb21taXQgNmNlZjIxYTE5NjQ5ICgiZHJtL2k5MTUvZ3Z0OiB1cGRhdGUgdnJlZyBvbiBp
bmhpYml0IGNvbnRleHQgbHJpCmNvbW1hbmQiKQoKU2lnbmVkLW9mZi1ieTogWWFuIFpoYW8gPHlh
bi55LnpoYW9AaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9jbWRfcGFy
c2VyLmMgfCAgOCArKy0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMg
ICB8IDI0IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDMwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2d2dC9jbWRfcGFyc2VyLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvY21kX3BhcnNl
ci5jCmluZGV4IDM1OTJkMDRjMzNiMi4uMzc4ODVlMDdjMTU3IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndnQvY21kX3BhcnNlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC9jbWRfcGFyc2VyLmMKQEAgLTkxMCwxMiArOTEwLDggQEAgc3RhdGljIGludCBjbWRfcmVn
X2hhbmRsZXIoc3RydWN0IHBhcnNlcl9leGVjX3N0YXRlICpzLAogCQkvKiBjaGVjayBpbmhpYml0
IGNvbnRleHQgKi8KIAkJaWYgKGN0eF9zcl9jdGwgJiAxKSB7CiAJCQl1MzIgZGF0YSA9IGNtZF92
YWwocywgaW5kZXggKyAxKTsKLQotCQkJaWYgKGludGVsX2d2dF9tbWlvX2hhc19tb2RlX21hc2so
cy0+dmdwdS0+Z3Z0LCBvZmZzZXQpKQotCQkJCWludGVsX3ZncHVfbWFza19tbWlvX3dyaXRlKHZn
cHUsCi0JCQkJCQkJb2Zmc2V0LCAmZGF0YSwgNCk7Ci0JCQllbHNlCi0JCQkJdmdwdV92cmVnKHZn
cHUsIG9mZnNldCkgPSBkYXRhOworCQkJaW50ZWxfdmdwdV9tbWlvX3JlZ19ydyhzLT52Z3B1LCBv
ZmZzZXQsICZkYXRhLAorCQkJCQk0LCBmYWxzZSk7CiAJCX0KIAl9CiAKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9oYW5kbGVycy5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z3Z0L2hhbmRsZXJzLmMKaW5kZXggNTRiZDBiMDMzMjk4Li41NDUxNTRhZjkzZTkgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9oYW5kbGVycy5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d2dC9oYW5kbGVycy5jCkBAIC0zNDAxLDMwICszNDAxLDYgQEAgaW50IGludGVs
X3ZncHVfZGVmYXVsdF9tbWlvX3dyaXRlKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LCB1bnNpZ25l
ZCBpbnQgb2Zmc2V0LAogCXJldHVybiAwOwogfQogCi0vKioKLSAqIGludGVsX3ZncHVfbWFza19t
bWlvX3dyaXRlIC0gd3JpdGUgbWFzayByZWdpc3RlcgotICogQHZncHU6IGEgdkdQVQotICogQG9m
ZnNldDogYWNjZXNzIG9mZnNldAotICogQHBfZGF0YTogd3JpdGUgZGF0YSBidWZmZXIKLSAqIEBi
eXRlczogYWNjZXNzIGRhdGEgbGVuZ3RoCi0gKgotICogUmV0dXJuczoKLSAqIFplcm8gb24gc3Vj
Y2VzcywgbmVnYXRpdmUgZXJyb3IgY29kZSBpZiBmYWlsZWQuCi0gKi8KLWludCBpbnRlbF92Z3B1
X21hc2tfbW1pb193cml0ZShzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwgdW5zaWduZWQgaW50IG9m
ZnNldCwKLQkJdm9pZCAqcF9kYXRhLCB1bnNpZ25lZCBpbnQgYnl0ZXMpCi17Ci0JdTMyIG1hc2ss
IG9sZF92cmVnOwotCi0Jb2xkX3ZyZWcgPSB2Z3B1X3ZyZWcodmdwdSwgb2Zmc2V0KTsKLQl3cml0
ZV92cmVnKHZncHUsIG9mZnNldCwgcF9kYXRhLCBieXRlcyk7Ci0JbWFzayA9IHZncHVfdnJlZyh2
Z3B1LCBvZmZzZXQpID4+IDE2OwotCXZncHVfdnJlZyh2Z3B1LCBvZmZzZXQpID0gKG9sZF92cmVn
ICYgfm1hc2spIHwKLQkJCQkodmdwdV92cmVnKHZncHUsIG9mZnNldCkgJiBtYXNrKTsKLQotCXJl
dHVybiAwOwotfQotCiAvKioKICAqIGludGVsX2d2dF9pbl9mb3JjZV9ub25wcml2X3doaXRlbGlz
dCAtIGlmIGEgbW1pbyBpcyBpbiB3aGl0ZWxpc3QgdG8gYmUKICAqIGZvcmNlLW5vcHJpdiByZWdp
c3RlcgotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2ludGVsLWd2dC1kZXY=
