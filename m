Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp7768069ywe;
        Fri, 8 Mar 2019 00:44:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqz5RacBo00IhgrjsdiFKQ1uLbgHYBuZs9fEsF+7OauT3329WHLVvpSHKorGNk+HCzSnHIgT
X-Received: by 2002:a63:c204:: with SMTP id b4mr15471054pgd.335.1552034645506;
        Fri, 08 Mar 2019 00:44:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552034645; cv=none;
        d=google.com; s=arc-20160816;
        b=UrFu/ujSFnzfyEACh1n2evwwZg+6tF35IZ40NsykylRLcolIXNeEKjZz/5do02dD0F
         i5z9HEUemyZpqtd2IfCVomh/ESkM0Pnzst+DpMMC3TDd2I6ciYwTSrCHF1dTEH+E8SHl
         8tFQLqzOR/3hEnscV3CrjxrvSIrcVcHaMa6Fz3vnUqUMiWw9JcR1McXrvSYn8SMS6VDf
         H76fsX1ciEd+Jq1rokIZ2iTp0+VcN7N/rT92mjR5L3GYkRhATprSDbdjgMzQ+MRRJPu2
         spmTCtpczjpyQ95ybNx46UUTl9Ua6NAgmJiVp3y2vEOP+ThKArt6X0yEBUhEsMsyhZBd
         FvCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:message-id:date:subject:to:from:delivered-to;
        bh=2cJYtCKSF3vJg9rOGa18zNSmXjYP9uOoWpPtkd4/vBk=;
        b=gh8evIopSW8rPvR/Jv/uWwjnbzgzl0HzY3BAXK/o620XAcjq8hyNF6S6fgxnsxcP1T
         3GbWkEVIvNjhq/0vaIR4lTL+f0NZTzrWHfi2d+SO6EATk3gtPr5DzD6Vgajplv6iaLAj
         P5gRnFqKGgz7DV67TTBxcd5VqzIxbGTwizybkGNUN+iC+xoLOdPUSjV2nJJmLCyWrCZ6
         n1pti7lal+m4YJChmT2tXHAKbcQiA3LHHYMr3bLFOR8xMGxVaGwYw4eV+jENOczr176B
         Xci61DONDDd873S4sCC3o3LaL64fM1fL6UmGXhlrP+isuy36SX3nMYph2Yd1fmkhX3IV
         Klug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id b6si5893624pgw.475.2019.03.08.00.44.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Mar 2019 00:44:05 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 202876E2D9;
	Fri,  8 Mar 2019 08:44:05 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01DEF6E2D9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  8 Mar 2019 08:44:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Mar 2019 00:44:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,455,1544515200"; d="scan'208";a="139087373"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.9])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Mar 2019 00:44:02 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v3 2/2] drm/i915/gvt: code refine of lri cmd parser
Date: Fri,  8 Mar 2019 03:38:40 -0500
Message-Id: <20190308083840.11188-1-yan.y.zhao@intel.com>
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
