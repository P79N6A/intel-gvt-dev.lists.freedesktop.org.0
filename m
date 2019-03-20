Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5a0b:0:0:0:0:0 with SMTP id o11csp348611ywb;
        Tue, 19 Mar 2019 23:47:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx/GMq1W1KChCy7SVMeWKlvfbZbsCxfT2BUmTFj1BgaJciFs1X9qhOq80axd5nJoxFhkC6N
X-Received: by 2002:a17:902:a81:: with SMTP id 1mr6291512plp.308.1553064432746;
        Tue, 19 Mar 2019 23:47:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553064432; cv=none;
        d=google.com; s=arc-20160816;
        b=lXxCZW3HntoPh8IGrOyBJ35g7ifa8wnTok2em7tQz1ajyuCZ1PahtmeH68ThBCO9bR
         liQBXcyH5dHCWV8o6BAmMToQDSactyP0PGD42ybPX/3wNCFTjDDuzoV1megRzGoWjIEZ
         /R4fQXfvZDRe6iaVQzjYUnBUmnswuFuia2DCwmFpUhcr8XJbbUhEEceVdeIdBTS80xxE
         +FqoeiQtift0cmjvHNHWddW4dgw0zCbIRbybPd3ryYahCfT8AdwVllWvb0ZvvfkfpeIu
         l3X44OXFkfM47FokjYN6W5GE2JAkXHSGF7fGxCI35k7ndjAM8IpNvr0ehEyiMjOGgCcm
         LSaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:references:in-reply-to:message-id:date
         :subject:to:from:delivered-to;
        bh=ZI4QghLoRBVSl3POqJ/0qH3cAIAr/Yq0dGrJYJJFyPg=;
        b=iBQzIgNKUmO1qh+nMGORIlFAMQ3y7Aty4AibtiVu/TnyhmOcfQYKzVAhRJNJGp/ype
         t/ewlsvrA0aTy+hOr5yQChc65LEmLdm143dV6OEpoNe/fBXVRb3CKrPFUE28cwU9uXNy
         YynbToq7w22dBulqBPtTSo4GwHUzOMACmx4+qGq+opSWRcLVwnHEEhKhxc4H7XShDFsJ
         xtBhV+KIM/9emqyvCes0rrQyxHrk/U3k4FpmHJ32LZJnvnWIDcA6qO5kINGFuhmaQQ1I
         ZxdKWAdPlnDsCa5dyxAhQ6J+yZLyHj2ToNdaZlC05/o8cN4QjlQc4G6zC+pgl+p66Z9i
         5wgw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id v34si964851pgk.320.2019.03.19.23.47.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2019 23:47:12 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E2A589C03;
	Wed, 20 Mar 2019 06:47:12 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A906B89C03
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 20 Mar 2019 06:47:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Mar 2019 23:47:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,248,1549958400"; d="scan'208";a="135787498"
Received: from coxu-arch-shz.sh.intel.com ([10.239.160.25])
 by fmsmga007.fm.intel.com with ESMTP; 19 Mar 2019 23:47:09 -0700
From: Colin Xu <colin.xu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 3/3] drm/i915/gvt: Enable async flip on plane surface mmio
 writes
Date: Wed, 20 Mar 2019 14:45:21 +0800
Message-Id: <20190320064521.31145-4-colin.xu@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190320064521.31145-1-colin.xu@intel.com>
References: <20190320064521.31145-1-colin.xu@intel.com>
MIME-Version: 1.0
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
Cc: colin.xu@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

QWNjb3JkaW5nIHRvIEludGVsIEdGWCBQUk0gb24gMDEub3JnLCBwbGFuZSBzdXJmYWNlIGFkZHJl
c3MgY2FuIGJlIHVwZGF0ZWQKc3luY2hyb25vdXNseSBvciBhc3luY2hyb25vdXNseS4gU3luY2hy
b25vdXMgZmxpcCB3aWxsIGhvbGQgcGxhbmUgc3VyZmFjZQphZGRyZXNzIHVwZGF0ZSB0byBzdGFy
dCBvZiBuZXh0IHZzeW5jLCB3aGljaCBpcyBjdXJyZW50IGltcGxlbWVudGF0aW9uLgpBc3luY2hy
b25vdXMgZmxpcCB3aWxsIHVwZGF0ZSB0aGUgYWRkcmVzcyBhcyBzb29uIGFzIHBvc3NpYmxlLiBX
aXRob3V0CmFzeW5jIGZsaXAsIHNvbWUgM0QgYXBwbGljYXRpb24gY291bGQgbm90IHJlYWNoIGJl
dHRlciBwZXJmb3JtYW5jZSBhbmQKdGhlIG1heGltdW0gcGVyZm9ybWFuY2UgaXMgbm8gaGlnaGVy
IHRoYW4gdnN5bmMgZnJlcXVlbmN5LgoKVGhlIHBhdGNoIGVuYWJsZXMgdGhlIGFzeW5jIGZsaXAg
b24gcGxhbmUgc3VyZmFjZSBhZGRyZXNzIG1taW8gdXBkYXRlLAphbmQgaW5jcmVtZW50IGZsaXAg
Y291bnQgY29ycmVjdGx5LgoKV2l0aCBhc3luYyBmbGlwIGVuYWJsZWQsIHNvbWUgM0QgYXBwbGlj
YXRpb25zIGhhdmUgc2lnbmlmaWNhbnQgcGVyZm9ybWFuY2UKaW1wcm92ZW1lbnQuIGkuZS4gM0RN
YXJrIEljZSBTdG9ybSBoYXMgYSAzMDAlfjQwMCUgaW5jcmVtZW50IG9uIHNjb3JlLgoKU2lnbmVk
LW9mZi1ieTogQ29saW4gWHUgPGNvbGluLnh1QGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndnQvZGlzcGxheS5jICB8ICAxIC0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9o
YW5kbGVycy5jIHwgOTkgKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0KIDIgZmlsZXMgY2hh
bmdlZCwgODEgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2Rpc3BsYXkuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2
dC9kaXNwbGF5LmMKaW5kZXggZTNmOWNhYTc4MzlmLi5lMWMzMTNkYTZjMDAgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kaXNwbGF5LmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Z0L2Rpc3BsYXkuYwpAQCAtNDA3LDcgKzQwNyw2IEBAIHN0YXRpYyB2b2lkIGVtdWxh
dGVfdmJsYW5rX29uX3BpcGUoc3RydWN0IGludGVsX3ZncHUgKnZncHUsIGludCBwaXBlKQogCQlp
ZiAoIXBpcGVfaXNfZW5hYmxlZCh2Z3B1LCBwaXBlKSkKIAkJCWNvbnRpbnVlOwogCi0JCXZncHVf
dnJlZ190KHZncHUsIFBJUEVfRkxJUENPVU5UX0c0WChwaXBlKSkrKzsKIAkJaW50ZWxfdmdwdV90
cmlnZ2VyX3ZpcnR1YWxfZXZlbnQodmdwdSwgZXZlbnQpOwogCX0KIApkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dnQvaGFuZGxlcnMuYwppbmRleCA2MzQxOGM4MWVmMTQuLjhmM2E1YTAxYWI3YSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMKQEAgLTc1MCwxOCArNzUwLDI2IEBAIHN0YXRpYyBpbnQg
cHJpX3N1cmZfbW1pb193cml0ZShzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwgdW5zaWduZWQgaW50
IG9mZnNldCwKIAkJdm9pZCAqcF9kYXRhLCB1bnNpZ25lZCBpbnQgYnl0ZXMpCiB7CiAJc3RydWN0
IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2ID0gdmdwdS0+Z3Z0LT5kZXZfcHJpdjsKLQl1bnNp
Z25lZCBpbnQgaW5kZXggPSBEU1BTVVJGX1RPX1BJUEUob2Zmc2V0KTsKLQlpOTE1X3JlZ190IHN1
cmZsaXZlX3JlZyA9IERTUFNVUkZMSVZFKGluZGV4KTsKLQlpbnQgZmxpcF9ldmVudFtdID0gewot
CQlbUElQRV9BXSA9IFBSSU1BUllfQV9GTElQX0RPTkUsCi0JCVtQSVBFX0JdID0gUFJJTUFSWV9C
X0ZMSVBfRE9ORSwKLQkJW1BJUEVfQ10gPSBQUklNQVJZX0NfRkxJUF9ET05FLAotCX07CisJdTMy
IHBpcGUgPSBEU1BTVVJGX1RPX1BJUEUob2Zmc2V0KTsKKwlpbnQgZXZlbnQgPSAwOworCisJaWYg
KHBpcGUgPT0gSU5WQUxJRF9QSVBFIHx8IHBpcGUgPiBQSVBFX0MpIHsKKwkJZ3Z0X3ZncHVfZXJy
KCJVbnN1cHBvcnRlZCBwaXBlLSVkIGZvciBQTEFORV9QUklNQVJZIVxuIiwgcGlwZSk7CisJCXJl
dHVybiAwOworCX0KKworCWV2ZW50ID0gU0tMX0ZMSVBfRVZFTlQocGlwZSwgUExBTkVfUFJJTUFS
WSk7CiAKIAl3cml0ZV92cmVnKHZncHUsIG9mZnNldCwgcF9kYXRhLCBieXRlcyk7Ci0JdmdwdV92
cmVnX3QodmdwdSwgc3VyZmxpdmVfcmVnKSA9IHZncHVfdnJlZyh2Z3B1LCBvZmZzZXQpOworCXZn
cHVfdnJlZ190KHZncHUsIERTUFNVUkZMSVZFKHBpcGUpKSA9IHZncHVfdnJlZyh2Z3B1LCBvZmZz
ZXQpOworCisJdmdwdV92cmVnX3QodmdwdSwgUElQRV9GTElQQ09VTlRfRzRYKHBpcGUpKSsrOwor
CisJaWYgKHZncHVfdnJlZ190KHZncHUsIERTUENOVFIocGlwZSkpICYgMHgyMDApCisJCWludGVs
X3ZncHVfdHJpZ2dlcl92aXJ0dWFsX2V2ZW50KHZncHUsIGV2ZW50KTsKKwllbHNlCisJCXNldF9i
aXQoZXZlbnQsIHZncHUtPmlycS5mbGlwX2RvbmVfZXZlbnRbcGlwZV0pOwogCi0Jc2V0X2JpdChm
bGlwX2V2ZW50W2luZGV4XSwgdmdwdS0+aXJxLmZsaXBfZG9uZV9ldmVudFtpbmRleF0pOwogCXJl
dHVybiAwOwogfQogCkBAIC03NzEsMTggKzc3OSw2MSBAQCBzdGF0aWMgaW50IHByaV9zdXJmX21t
aW9fd3JpdGUoc3RydWN0IGludGVsX3ZncHUgKnZncHUsIHVuc2lnbmVkIGludCBvZmZzZXQsCiBz
dGF0aWMgaW50IHNwcl9zdXJmX21taW9fd3JpdGUoc3RydWN0IGludGVsX3ZncHUgKnZncHUsIHVu
c2lnbmVkIGludCBvZmZzZXQsCiAJCXZvaWQgKnBfZGF0YSwgdW5zaWduZWQgaW50IGJ5dGVzKQog
ewotCXVuc2lnbmVkIGludCBpbmRleCA9IFNQUlNVUkZfVE9fUElQRShvZmZzZXQpOwotCWk5MTVf
cmVnX3Qgc3VyZmxpdmVfcmVnID0gU1BSU1VSRkxJVkUoaW5kZXgpOwotCWludCBmbGlwX2V2ZW50
W10gPSB7Ci0JCVtQSVBFX0FdID0gU1BSSVRFX0FfRkxJUF9ET05FLAotCQlbUElQRV9CXSA9IFNQ
UklURV9CX0ZMSVBfRE9ORSwKLQkJW1BJUEVfQ10gPSBTUFJJVEVfQ19GTElQX0RPTkUsCi0JfTsK
Kwl1MzIgcGlwZSA9IFNQUlNVUkZfVE9fUElQRShvZmZzZXQpOworCWludCBldmVudCA9IDA7CisK
KwlpZiAocGlwZSA9PSBJTlZBTElEX1BJUEUgfHwgcGlwZSA+IFBJUEVfQykgeworCQlndnRfdmdw
dV9lcnIoIlVuc3VwcG9ydGVkIHBpcGUtJWQgZm9yIFBMQU5FX1NQUklURTAhXG4iLCBwaXBlKTsK
KwkJcmV0dXJuIDA7CisJfQorCisJZXZlbnQgPSBTS0xfRkxJUF9FVkVOVChwaXBlLCBQTEFORV9T
UFJJVEUwKTsKKworCXdyaXRlX3ZyZWcodmdwdSwgb2Zmc2V0LCBwX2RhdGEsIGJ5dGVzKTsKKwl2
Z3B1X3ZyZWdfdCh2Z3B1LCBTUFJTVVJGTElWRShwaXBlKSkgPSB2Z3B1X3ZyZWcodmdwdSwgb2Zm
c2V0KTsKKworCWlmICh2Z3B1X3ZyZWdfdCh2Z3B1LCBTUFJDVEwocGlwZSkpICYgMHgyMDApCisJ
CWludGVsX3ZncHVfdHJpZ2dlcl92aXJ0dWFsX2V2ZW50KHZncHUsIGV2ZW50KTsKKwllbHNlCisJ
CXNldF9iaXQoZXZlbnQsIHZncHUtPmlycS5mbGlwX2RvbmVfZXZlbnRbcGlwZV0pOworCisJcmV0
dXJuIDA7Cit9CisKK3N0YXRpYyBpbnQgcmVnNTAwODBfbW1pb193cml0ZShzdHJ1Y3QgaW50ZWxf
dmdwdSAqdmdwdSwKKwkJCSAgICAgICB1bnNpZ25lZCBpbnQgb2Zmc2V0LCB2b2lkICpwX2RhdGEs
CisJCQkgICAgICAgdW5zaWduZWQgaW50IGJ5dGVzKQoreworCXN0cnVjdCBkcm1faTkxNV9wcml2
YXRlICpkZXZfcHJpdiA9IHZncHUtPmd2dC0+ZGV2X3ByaXY7CisJZW51bSBwaXBlIHBpcGUgPSBS
RUdfNTAwODBfVE9fUElQRShvZmZzZXQpOworCWVudW0gcGxhbmVfaWQgcGxhbmUgPSBSRUdfNTAw
ODBfVE9fUExBTkUob2Zmc2V0KTsKKwlpbnQgZXZlbnQgPSAwOworCisJaWYgKHBsYW5lICE9IFBM
QU5FX1BSSU1BUlkgJiYgcGxhbmUgIT0gUExBTkVfU1BSSVRFMCkgeworCQlndnRfdmdwdV9lcnIo
IlVuc3VwcG9ydGVkIHBsYW5lLSVkIVxuIiwgcGxhbmUpOworCQlyZXR1cm4gMDsKKwl9CisKKwlp
ZiAocGlwZSA9PSBJTlZBTElEX1BJUEUgfHwgcGlwZSA+IFBJUEVfQykgeworCQlndnRfdmdwdV9l
cnIoIlVuc3VwcG9ydGVkIHBpcGUtJWQgZm9yIHBsYW5lLSVkIVxuIiwgcGlwZSwgcGxhbmUpOwor
CQlyZXR1cm4gMDsKKwl9CisKKwlldmVudCA9IFNLTF9GTElQX0VWRU5UKHBpcGUsIHBsYW5lKTsK
IAogCXdyaXRlX3ZyZWcodmdwdSwgb2Zmc2V0LCBwX2RhdGEsIGJ5dGVzKTsKLQl2Z3B1X3ZyZWdf
dCh2Z3B1LCBzdXJmbGl2ZV9yZWcpID0gdmdwdV92cmVnKHZncHUsIG9mZnNldCk7CisJaWYgKHBs
YW5lID09IFBMQU5FX1BSSU1BUlkpIHsKKwkJdmdwdV92cmVnX3QodmdwdSwgRFNQU1VSRkxJVkUo
cGlwZSkpID0gdmdwdV92cmVnKHZncHUsIG9mZnNldCk7CisJCXZncHVfdnJlZ190KHZncHUsIFBJ
UEVfRkxJUENPVU5UX0c0WChwaXBlKSkrKzsKKwl9IGVsc2UgeworCQl2Z3B1X3ZyZWdfdCh2Z3B1
LCBTUFJTVVJGTElWRShwaXBlKSkgPSB2Z3B1X3ZyZWcodmdwdSwgb2Zmc2V0KTsKKwl9CisKKwlp
ZiAoKHZncHVfdnJlZyh2Z3B1LCBvZmZzZXQpICYgMHgzKSA9PSAxKQorCQlpbnRlbF92Z3B1X3Ry
aWdnZXJfdmlydHVhbF9ldmVudCh2Z3B1LCBldmVudCk7CisJZWxzZQorCQlzZXRfYml0KGV2ZW50
LCB2Z3B1LT5pcnEuZmxpcF9kb25lX2V2ZW50W3BpcGVdKTsKIAotCXNldF9iaXQoZmxpcF9ldmVu
dFtpbmRleF0sIHZncHUtPmlycS5mbGlwX2RvbmVfZXZlbnRbaW5kZXhdKTsKIAlyZXR1cm4gMDsK
IH0KIApAQCAtMTk2OSw2ICsyMDIwLDggQEAgc3RhdGljIGludCBpbml0X2dlbmVyaWNfbW1pb19p
bmZvKHN0cnVjdCBpbnRlbF9ndnQgKmd2dCkKIAlNTUlPX0RIKERTUFNVUkYoUElQRV9BKSwgRF9B
TEwsIE5VTEwsIHByaV9zdXJmX21taW9fd3JpdGUpOwogCU1NSU9fRChEU1BPRkZTRVQoUElQRV9B
KSwgRF9BTEwpOwogCU1NSU9fRChEU1BTVVJGTElWRShQSVBFX0EpLCBEX0FMTCk7CisJTU1JT19E
SChSRUdfNTAwODAoUElQRV9BLCBQTEFORV9QUklNQVJZKSwgRF9BTEwsIE5VTEwsCisJCXJlZzUw
MDgwX21taW9fd3JpdGUpOwogCiAJTU1JT19EKERTUENOVFIoUElQRV9CKSwgRF9BTEwpOwogCU1N
SU9fRChEU1BBRERSKFBJUEVfQiksIERfQUxMKTsKQEAgLTE5NzgsNiArMjAzMSw4IEBAIHN0YXRp
YyBpbnQgaW5pdF9nZW5lcmljX21taW9faW5mbyhzdHJ1Y3QgaW50ZWxfZ3Z0ICpndnQpCiAJTU1J
T19ESChEU1BTVVJGKFBJUEVfQiksIERfQUxMLCBOVUxMLCBwcmlfc3VyZl9tbWlvX3dyaXRlKTsK
IAlNTUlPX0QoRFNQT0ZGU0VUKFBJUEVfQiksIERfQUxMKTsKIAlNTUlPX0QoRFNQU1VSRkxJVkUo
UElQRV9CKSwgRF9BTEwpOworCU1NSU9fREgoUkVHXzUwMDgwKFBJUEVfQiwgUExBTkVfUFJJTUFS
WSksIERfQUxMLCBOVUxMLAorCQlyZWc1MDA4MF9tbWlvX3dyaXRlKTsKIAogCU1NSU9fRChEU1BD
TlRSKFBJUEVfQyksIERfQUxMKTsKIAlNTUlPX0QoRFNQQUREUihQSVBFX0MpLCBEX0FMTCk7CkBA
IC0xOTg3LDYgKzIwNDIsOCBAQCBzdGF0aWMgaW50IGluaXRfZ2VuZXJpY19tbWlvX2luZm8oc3Ry
dWN0IGludGVsX2d2dCAqZ3Z0KQogCU1NSU9fREgoRFNQU1VSRihQSVBFX0MpLCBEX0FMTCwgTlVM
TCwgcHJpX3N1cmZfbW1pb193cml0ZSk7CiAJTU1JT19EKERTUE9GRlNFVChQSVBFX0MpLCBEX0FM
TCk7CiAJTU1JT19EKERTUFNVUkZMSVZFKFBJUEVfQyksIERfQUxMKTsKKwlNTUlPX0RIKFJFR181
MDA4MChQSVBFX0MsIFBMQU5FX1BSSU1BUlkpLCBEX0FMTCwgTlVMTCwKKwkJcmVnNTAwODBfbW1p
b193cml0ZSk7CiAKIAlNTUlPX0QoU1BSQ1RMKFBJUEVfQSksIERfQUxMKTsKIAlNTUlPX0QoU1BS
TElOT0ZGKFBJUEVfQSksIERfQUxMKTsKQEAgLTIwMDAsNiArMjA1Nyw4IEBAIHN0YXRpYyBpbnQg
aW5pdF9nZW5lcmljX21taW9faW5mbyhzdHJ1Y3QgaW50ZWxfZ3Z0ICpndnQpCiAJTU1JT19EKFNQ
Uk9GRlNFVChQSVBFX0EpLCBEX0FMTCk7CiAJTU1JT19EKFNQUlNDQUxFKFBJUEVfQSksIERfQUxM
KTsKIAlNTUlPX0QoU1BSU1VSRkxJVkUoUElQRV9BKSwgRF9BTEwpOworCU1NSU9fREgoUkVHXzUw
MDgwKFBJUEVfQSwgUExBTkVfU1BSSVRFMCksIERfQUxMLCBOVUxMLAorCQlyZWc1MDA4MF9tbWlv
X3dyaXRlKTsKIAogCU1NSU9fRChTUFJDVEwoUElQRV9CKSwgRF9BTEwpOwogCU1NSU9fRChTUFJM
SU5PRkYoUElQRV9CKSwgRF9BTEwpOwpAQCAtMjAxMyw2ICsyMDcyLDggQEAgc3RhdGljIGludCBp
bml0X2dlbmVyaWNfbW1pb19pbmZvKHN0cnVjdCBpbnRlbF9ndnQgKmd2dCkKIAlNTUlPX0QoU1BS
T0ZGU0VUKFBJUEVfQiksIERfQUxMKTsKIAlNTUlPX0QoU1BSU0NBTEUoUElQRV9CKSwgRF9BTEwp
OwogCU1NSU9fRChTUFJTVVJGTElWRShQSVBFX0IpLCBEX0FMTCk7CisJTU1JT19ESChSRUdfNTAw
ODAoUElQRV9CLCBQTEFORV9TUFJJVEUwKSwgRF9BTEwsIE5VTEwsCisJCXJlZzUwMDgwX21taW9f
d3JpdGUpOwogCiAJTU1JT19EKFNQUkNUTChQSVBFX0MpLCBEX0FMTCk7CiAJTU1JT19EKFNQUkxJ
Tk9GRihQSVBFX0MpLCBEX0FMTCk7CkBAIC0yMDI2LDYgKzIwODcsOCBAQCBzdGF0aWMgaW50IGlu
aXRfZ2VuZXJpY19tbWlvX2luZm8oc3RydWN0IGludGVsX2d2dCAqZ3Z0KQogCU1NSU9fRChTUFJP
RkZTRVQoUElQRV9DKSwgRF9BTEwpOwogCU1NSU9fRChTUFJTQ0FMRShQSVBFX0MpLCBEX0FMTCk7
CiAJTU1JT19EKFNQUlNVUkZMSVZFKFBJUEVfQyksIERfQUxMKTsKKwlNTUlPX0RIKFJFR181MDA4
MChQSVBFX0MsIFBMQU5FX1NQUklURTApLCBEX0FMTCwgTlVMTCwKKwkJcmVnNTAwODBfbW1pb193
cml0ZSk7CiAKIAlNTUlPX0QoSFRPVEFMKFRSQU5TQ09ERVJfQSksIERfQUxMKTsKIAlNTUlPX0Qo
SEJMQU5LKFRSQU5TQ09ERVJfQSksIERfQUxMKTsKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxp
c3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
