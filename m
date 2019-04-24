Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp184309ywo;
        Tue, 23 Apr 2019 22:50:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz+JizpYgFyBoB9P7sayoSEH75M7bG50SKb4LAgHwfNfdMK/TlnbqT2vxiCzzpOzwAld061
X-Received: by 2002:a17:902:e4:: with SMTP id a91mr29985198pla.2.1556085046689;
        Tue, 23 Apr 2019 22:50:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556085046; cv=none;
        d=google.com; s=arc-20160816;
        b=Qg033espIEvquFku4Opo3rWC4NcBMbYZQD4576UF+dNa4g8TV+doqvOghuV3mk6xuA
         3E/nr/ifcboeZVgFux1lmYNeKE1mULhTshWHlUh/Jo1z1ZPxlsUCaKhgHdDmTjyNdIaR
         8EOpB4Gy3SaVTowpC9z1PrbTLV7F3JjscuTYjNICxXJlH5XRVsnOSMm1UB/VE3xjZUhZ
         aFNo/QrkGSrx5gGCpdJh0xYL/ocABqj/yLGdh9tR+3Liz+rqSVJpgWQMEMcCPvAvAlG8
         uaROXiGRdB8mPju6niUYLHjWsa0FK30Esfhz4R84rJ3R7cLs0D7f4hbXXxRG5ykDT3SV
         KTuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=TUgmL5xJducbESdCwXJw9g74bKsQv0wHdCIK7fPlynA=;
        b=qZXXEi15MCngo+NkuOt/DFPg1RM18rhmrKyViXbRwHDX1dVOrQOYDx/RirjeKSk52b
         XNUN0knYqMENIR37Bg14Oi4xgVvj4B/SePrUKzvqf/ZtNqi+7jn/DP95rfoJKTHsf6AX
         XODGuxpheXlM8mOX148oTriTvs9ywjATtLpHqyFy61uH6RSh1tMeTFj3nkkwjpPnMstn
         01ceaZ5Y6lLTmrca0gWfMp2X64A7vf9xwbIeZZ2pZ2KKa1QnDPDV631LBZL3ucuZSzQ4
         pUKunxcyf3RUCKPw4sA3dqKFhceRx5J9tTcf32TPfbe6MEiXO9ob1+Fz92BaIYnhZkHf
         /xcw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id w3si16694626pgr.189.2019.04.23.22.50.46
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Apr 2019 22:50:46 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BB67896E9;
	Wed, 24 Apr 2019 05:50:46 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3160896E9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 24 Apr 2019 05:50:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Apr 2019 22:50:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,388,1549958400"; d="scan'208";a="143140838"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.9])
 by fmsmga008.fm.intel.com with ESMTP; 23 Apr 2019 22:50:44 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 4/4] drm/i915/gvt: do not let TRTTE and 0x4dfc write
 passthrough to harware
Date: Wed, 24 Apr 2019 01:45:11 -0400
Message-Id: <20190424054511.8225-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190424054305.8054-1-yan.y.zhao@intel.com>
References: <20190424054305.8054-1-yan.y.zhao@intel.com>
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

dGhlIHZHUFUgd3JpdGUgb24gVFJUVEUgYW5kIDB4NGRmYyBpcyBub3cgd3JpdGUgdG8gdnJlZyBm
aXJzdC4gdGhlaXIKdmFsdWVzIGFsbCBiZSByZXN0b3JlZCBoYXJkd2FyZSB3aGVuIGNvbnRleHQg
c3dpdGNoaW5nLgoKU2lnbmVkLW9mZi1ieTogWWFuIFpoYW8gPHlhbi55LnpoYW9AaW50ZWwuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9oYW5kbGVycy5jIHwgMTUgLS0tLS0tLS0t
LS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dnQvaGFuZGxlcnMuYwppbmRleCAxOGYwMWVlYjI1MTAuLjQ3YTM2ZWU1ZjA1NiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMKQEAgLTEzNjQsNyArMTM2NCw2IEBAIHN0YXRpYyBpbnQg
ZG1hX2N0cmxfd3JpdGUoc3RydWN0IGludGVsX3ZncHUgKnZncHUsIHVuc2lnbmVkIGludCBvZmZz
ZXQsCiBzdGF0aWMgaW50IGdlbjlfdHJ0dGVfd3JpdGUoc3RydWN0IGludGVsX3ZncHUgKnZncHUs
IHVuc2lnbmVkIGludCBvZmZzZXQsCiAJCXZvaWQgKnBfZGF0YSwgdW5zaWduZWQgaW50IGJ5dGVz
KQogewotCXN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdiA9IHZncHUtPmd2dC0+ZGV2
X3ByaXY7CiAJdTMyIHRydHRlID0gKih1MzIgKilwX2RhdGE7CiAKIAlpZiAoKHRydHRlICYgMSkg
JiYgKHRydHRlICYgKDEgPDwgMSkpID09IDApIHsKQEAgLTEzNzMsMTEgKzEzNzIsNiBAQCBzdGF0
aWMgaW50IGdlbjlfdHJ0dGVfd3JpdGUoc3RydWN0IGludGVsX3ZncHUgKnZncHUsIHVuc2lnbmVk
IGludCBvZmZzZXQsCiAJCXJldHVybiAtRUlOVkFMOwogCX0KIAl3cml0ZV92cmVnKHZncHUsIG9m
ZnNldCwgcF9kYXRhLCBieXRlcyk7Ci0JLyogVFJUVEUgaXMgbm90IHBlci1jb250ZXh0ICovCi0K
LQltbWlvX2h3X2FjY2Vzc19wcmUoZGV2X3ByaXYpOwotCUk5MTVfV1JJVEUoX01NSU8ob2Zmc2V0
KSwgdmdwdV92cmVnKHZncHUsIG9mZnNldCkpOwotCW1taW9faHdfYWNjZXNzX3Bvc3QoZGV2X3By
aXYpOwogCiAJcmV0dXJuIDA7CiB9CkBAIC0xMzg1LDE1ICsxMzc5LDYgQEAgc3RhdGljIGludCBn
ZW45X3RydHRlX3dyaXRlKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LCB1bnNpZ25lZCBpbnQgb2Zm
c2V0LAogc3RhdGljIGludCBnZW45X3RydHRfY2hpY2tlbl93cml0ZShzdHJ1Y3QgaW50ZWxfdmdw
dSAqdmdwdSwgdW5zaWduZWQgaW50IG9mZnNldCwKIAkJdm9pZCAqcF9kYXRhLCB1bnNpZ25lZCBp
bnQgYnl0ZXMpCiB7Ci0Jc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2ID0gdmdwdS0+
Z3Z0LT5kZXZfcHJpdjsKLQl1MzIgdmFsID0gKih1MzIgKilwX2RhdGE7Ci0KLQlpZiAodmFsICYg
MSkgewotCQkvKiB1bmJsb2NrIGh3IGxvZ2ljICovCi0JCW1taW9faHdfYWNjZXNzX3ByZShkZXZf
cHJpdik7Ci0JCUk5MTVfV1JJVEUoX01NSU8ob2Zmc2V0KSwgdmFsKTsKLQkJbW1pb19od19hY2Nl
c3NfcG9zdChkZXZfcHJpdik7Ci0JfQogCXdyaXRlX3ZyZWcodmdwdSwgb2Zmc2V0LCBwX2RhdGEs
IGJ5dGVzKTsKIAlyZXR1cm4gMDsKIH0KLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50
ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
