Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5a0b:0:0:0:0:0 with SMTP id o11csp929894ywb;
        Sun, 10 Mar 2019 18:46:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzqYdDettg/P388N6pQZTrW3IrWDUtrMr3dxM6nI6S4tzfkBZ6IUGGJK7BCn3Q4tSAMUKVR
X-Received: by 2002:a63:3fc8:: with SMTP id m191mr28088221pga.240.1552268806982;
        Sun, 10 Mar 2019 18:46:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552268806; cv=none;
        d=google.com; s=arc-20160816;
        b=f9sZWVREtmlmHhg0d6kiCZYQNKjmICYp9csznTtDmy4lXM2vOPcIa+1F6OoPq104f8
         dWQJXzx1gAZu7HCEhdf5tDg32bvKea5xnwoSz/Zmw7OiwoRzCp7u2PQayw3PozJyNry2
         R4e8FhUnXFFdeH0ddUeCD+21yCXmk35la0RV04jZeQrVMldFHjq/QvoEuckDYmkLHxFc
         O+dvIpp9rT9z6Hp3WBYLv8PpCQS72q53Dz+l6ui1EQchmniGMVoDA0s23H8TIF/b6MZB
         F4xingQirljGk+yCepzXRJSv6RQAA7pPWc3hLo5oni0+Ugsi/wPYFSHatv1oPiIhwXiM
         zqVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:message-id:date:subject:to:from:delivered-to;
        bh=iBQT88Y9+z5sHu8LdT77e3A8lZay+3tC2c8PqBe8s80=;
        b=CnKDZWJDiFMDqMHZlpmxAOhqJ03EiIjLtekdVzvNS1x0RmmbKDuNgfn2DezSVTyPQT
         62C3n3mOiNPFDK7wgt7BsQKVr6l0KJOmtbTp4eeASUEY5PPBudBah2/nq7f/B6puetV4
         SCVIWw4ulN+guPdUWeL1sO/eiN/q7KR0y3eLjm3lXvH27/uyW5lLxTuenogbWZrA8JgT
         5fNf5Im7DEEi5kvwnqFZ7zg5oJg3WsVYR1jwSrfW8qtNZv9VkUaY4/XHGE4RXA1EZzul
         E7pkXRgLAH95NXt2AxShxtYpVyL15BDZ9ZiWB5gkWLSLBv1norHsFlUXmIGwoUGiAv9f
         tZsw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id f89si4600712plb.20.2019.03.10.18.46.46
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 10 Mar 2019 18:46:46 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8DFA899B0;
	Mon, 11 Mar 2019 01:46:45 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 615DB899B0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 11 Mar 2019 01:46:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Mar 2019 18:46:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,466,1544515200"; d="scan'208";a="125809253"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.9])
 by orsmga006.jf.intel.com with ESMTP; 10 Mar 2019 18:46:42 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v5 1/2] drm/i915/gvt: remove the unused sreg
Date: Sun, 10 Mar 2019 21:40:45 -0400
Message-Id: <20190311014045.13977-1-yan.y.zhao@intel.com>
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
ZWFubmVzcy4KCnYzOiByZW1vdmUgdW5uZWNlc3NhcnkgYXJyYXlfc2l6ZSBpbiB2cmVnJ3MgbWVt
b3J5IGFsbG9jYXRpb24gKG1pbiBoZSkKdjI6IGRvIG5vdCBhbGxvY2F0ZSBtZW1vcnkgZm9yIHNy
ZWcuIChtaW4gaGUpCgpTaWduZWQtb2ZmLWJ5OiBZYW4gWmhhbyA8eWFuLnkuemhhb0BpbnRlbC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d2dC5oICAgICAgfCA1IC0tLS0tCiBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYyB8IDUgKy0tLS0KIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2d2dC9tbWlvLmMgICAgIHwgOCArKy0tLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d2dC9ndnQuaCBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndnQuaAppbmRl
eCBlZjcxMGUyNTk3MjYuLmE0ZmQ5NzliM2RhZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Z0L2d2dC5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndnQuaApAQCAt
OTQsNyArOTQsNiBAQCBzdHJ1Y3QgaW50ZWxfdmdwdV9mZW5jZSB7CiAKIHN0cnVjdCBpbnRlbF92
Z3B1X21taW8gewogCXZvaWQgKnZyZWc7Ci0Jdm9pZCAqc3JlZzsKIH07CiAKICNkZWZpbmUgSU5U
RUxfR1ZUX01BWF9CQVJfTlVNIDQKQEAgLTQ0NywxMCArNDQ2LDYgQEAgdm9pZCBpbnRlbF92Z3B1
X3dyaXRlX2ZlbmNlKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LAogCSgqKHU2NCAqKSh2Z3B1LT5t
bWlvLnZyZWcgKyBpOTE1X21taW9fcmVnX29mZnNldChyZWcpKSkKICNkZWZpbmUgdmdwdV92cmVn
NjQodmdwdSwgb2Zmc2V0KSBcCiAJKCoodTY0ICopKHZncHUtPm1taW8udnJlZyArIChvZmZzZXQp
KSkKLSNkZWZpbmUgdmdwdV9zcmVnX3QodmdwdSwgcmVnKSBcCi0JKCoodTMyICopKHZncHUtPm1t
aW8uc3JlZyArIGk5MTVfbW1pb19yZWdfb2Zmc2V0KHJlZykpKQotI2RlZmluZSB2Z3B1X3NyZWco
dmdwdSwgb2Zmc2V0KSBcCi0JKCoodTMyICopKHZncHUtPm1taW8uc3JlZyArIChvZmZzZXQpKSkK
IAogI2RlZmluZSBmb3JfZWFjaF9hY3RpdmVfdmdwdShndnQsIHZncHUsIGlkKSBcCiAJaWRyX2Zv
cl9lYWNoX2VudHJ5KCgmKGd2dCktPnZncHVfaWRyKSwgKHZncHUpLCAoaWQpKSBcCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d2dC9oYW5kbGVycy5jCmluZGV4IGI1YzBhYzA0OTI1Zi4uNTRiZDBiMDMzMjk4IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYwpAQCAtMzQ4OSwxMiArMzQ4OSwxMSBAQCBp
bnQgaW50ZWxfdmdwdV9tbWlvX3JlZ19ydyhzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwgdW5zaWdu
ZWQgaW50IG9mZnNldCwKIAkJcmV0dXJuIG1taW9faW5mby0+cmVhZCh2Z3B1LCBvZmZzZXQsIHBk
YXRhLCBieXRlcyk7CiAJZWxzZSB7CiAJCXU2NCByb19tYXNrID0gbW1pb19pbmZvLT5yb19tYXNr
OwotCQl1MzIgb2xkX3ZyZWcgPSAwLCBvbGRfc3JlZyA9IDA7CisJCXUzMiBvbGRfdnJlZyA9IDA7
CiAJCXU2NCBkYXRhID0gMDsKIAogCQlpZiAoaW50ZWxfZ3Z0X21taW9faGFzX21vZGVfbWFzayhn
dnQsIG1taW9faW5mby0+b2Zmc2V0KSkgewogCQkJb2xkX3ZyZWcgPSB2Z3B1X3ZyZWcodmdwdSwg
b2Zmc2V0KTsKLQkJCW9sZF9zcmVnID0gdmdwdV9zcmVnKHZncHUsIG9mZnNldCk7CiAJCX0KIAog
CQlpZiAobGlrZWx5KCFyb19tYXNrKSkKQEAgLTM1MTYsOCArMzUxNSw2IEBAIGludCBpbnRlbF92
Z3B1X21taW9fcmVnX3J3KHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LCB1bnNpZ25lZCBpbnQgb2Zm
c2V0LAogCiAJCQl2Z3B1X3ZyZWcodmdwdSwgb2Zmc2V0KSA9IChvbGRfdnJlZyAmIH5tYXNrKQog
CQkJCQl8ICh2Z3B1X3ZyZWcodmdwdSwgb2Zmc2V0KSAmIG1hc2spOwotCQkJdmdwdV9zcmVnKHZn
cHUsIG9mZnNldCkgPSAob2xkX3NyZWcgJiB+bWFzaykKLQkJCQkJfCAodmdwdV9zcmVnKHZncHUs
IG9mZnNldCkgJiBtYXNrKTsKIAkJfQogCX0KIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Z0L21taW8uYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9tbWlvLmMKaW5kZXgg
ZWQ0ZGYyZjZkNjBiLi5hNTUxNzg4ODRkNjcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2d2dC9tbWlvLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21taW8uYwpAQCAt
MjM5LDcgKzIzOSw2IEBAIHZvaWQgaW50ZWxfdmdwdV9yZXNldF9tbWlvKHN0cnVjdCBpbnRlbF92
Z3B1ICp2Z3B1LCBib29sIGRtbHIpCiAKIAlpZiAoZG1scikgewogCQltZW1jcHkodmdwdS0+bW1p
by52cmVnLCBtbWlvLCBpbmZvLT5tbWlvX3NpemUpOwotCQltZW1jcHkodmdwdS0+bW1pby5zcmVn
LCBtbWlvLCBpbmZvLT5tbWlvX3NpemUpOwogCiAJCXZncHVfdnJlZ190KHZncHUsIEdFTjZfR1Rf
VEhSRUFEX1NUQVRVU19SRUcpID0gMDsKIApAQCAtMjgwLDcgKzI3OSw2IEBAIHZvaWQgaW50ZWxf
dmdwdV9yZXNldF9tbWlvKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LCBib29sIGRtbHIpCiAJCSAq
IHRvdWNoZWQKIAkJICovCiAJCW1lbWNweSh2Z3B1LT5tbWlvLnZyZWcsIG1taW8sIEdWVF9HRU44
X01NSU9fUkVTRVRfT0ZGU0VUKTsKLQkJbWVtY3B5KHZncHUtPm1taW8uc3JlZywgbW1pbywgR1ZU
X0dFTjhfTU1JT19SRVNFVF9PRkZTRVQpOwogCX0KIAogfQpAQCAtMjk2LDEyICsyOTQsMTAgQEAg
aW50IGludGVsX3ZncHVfaW5pdF9tbWlvKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1KQogewogCWNv
bnN0IHN0cnVjdCBpbnRlbF9ndnRfZGV2aWNlX2luZm8gKmluZm8gPSAmdmdwdS0+Z3Z0LT5kZXZp
Y2VfaW5mbzsKIAotCXZncHUtPm1taW8udnJlZyA9IHZ6YWxsb2MoYXJyYXlfc2l6ZShpbmZvLT5t
bWlvX3NpemUsIDIpKTsKKwl2Z3B1LT5tbWlvLnZyZWcgPSB2emFsbG9jKGluZm8tPm1taW9fc2l6
ZSk7CiAJaWYgKCF2Z3B1LT5tbWlvLnZyZWcpCiAJCXJldHVybiAtRU5PTUVNOwogCi0JdmdwdS0+
bW1pby5zcmVnID0gdmdwdS0+bW1pby52cmVnICsgaW5mby0+bW1pb19zaXplOwotCiAJaW50ZWxf
dmdwdV9yZXNldF9tbWlvKHZncHUsIHRydWUpOwogCiAJcmV0dXJuIDA7CkBAIC0zMTUsNSArMzEx
LDUgQEAgaW50IGludGVsX3ZncHVfaW5pdF9tbWlvKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1KQog
dm9pZCBpbnRlbF92Z3B1X2NsZWFuX21taW8oc3RydWN0IGludGVsX3ZncHUgKnZncHUpCiB7CiAJ
dmZyZWUodmdwdS0+bW1pby52cmVnKTsKLQl2Z3B1LT5tbWlvLnZyZWcgPSB2Z3B1LT5tbWlvLnNy
ZWcgPSBOVUxMOworCXZncHUtPm1taW8udnJlZyA9IE5VTEw7CiB9Ci0tIAoyLjE3LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYg
bWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
