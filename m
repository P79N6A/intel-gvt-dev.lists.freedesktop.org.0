Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp434919ywa;
        Wed, 13 Feb 2019 20:56:38 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZnnTQ9iiuSnt/zH/xrtdmxoWnjaDXeyfATuKTiyrDf7U0p7AgaYpZUxkLZDgzMt7RPrVrG
X-Received: by 2002:a63:580f:: with SMTP id m15mr1959080pgb.342.1550120198066;
        Wed, 13 Feb 2019 20:56:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550120198; cv=none;
        d=google.com; s=arc-20160816;
        b=gtDAmvnDU0Ca9iHkCieoOI5hvmKxh5ZAf6xeT2tWwwV1QjiuVnp6W9/DEcUP3R4ejA
         qqFjpgRaNcWRzO7USKwesKK+cT7jBr0REhqyd+qGklnkO2+a+2NtzYyMVzOvXTXvw+3U
         oMtcnwklVfIJc8J8jmZ+7odritI+cXQDH0VN5DZLdvYixpCPC/rAwYgIdI7buA+v1XRi
         p1gTkENjV/XWhqIi0jb0CxDK1S+JtL4SmmE191TMNHjv+p/eMmoIahcazpMmk4OgAgRi
         8y6q4UFGxG5/oP0uyy53NGTdRAc1iUtUSbcbZh3dpRDqu5mxJmwXAXe1yWUFEVgHbfgo
         o4vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:message-id:date:subject:to:from
         :delivered-to;
        bh=AnsskejDdgoqWazVKM5QKGEH8Cb9Xh4SU8MH15rBI/0=;
        b=vmHZheQ8+k/LK++h2wQTFP11ssh1wFjdvJYmNkMNDLHJv31pCDUsIiqBCQjlRutSNm
         zSoAxYOkNRFKudLjwY7wacLKt9IwbwrI0cURzEswXKgL69kpk4ww7T9Q7mcGXmhDxP5g
         t5krmJkLwCVInjEa5Mzwukd8qA+Hzw3oAdsJkU6n+HDmZtQJqqbZ7BgCK64hmcR8ReC+
         DuyK4VlruRjx89NOkE6e5wLtIK2jxH0sxJOuRnuJUN658LM5vtH/vQb5WWZI7iDr6Sp9
         AEBQELZ9moyGU/iboVMIAbtH7RbVQERjzuqw19JrZ2iL7v17nuNg9BiMUk3Kb10Dv3wc
         9dtA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id e4si1695959plk.300.2019.02.13.20.56.37
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Feb 2019 20:56:38 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 082F26E868;
	Thu, 14 Feb 2019 04:56:37 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3793F6E868
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 14 Feb 2019 04:56:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Feb 2019 20:56:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,367,1544515200"; d="scan'208";a="124363093"
Received: from coxu-arch-shz.sh.intel.com ([10.239.160.22])
 by fmsmga008.fm.intel.com with ESMTP; 13 Feb 2019 20:56:34 -0800
From: Colin Xu <colin.xu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: Use consist max display pipe numbers as i915
 definition
Date: Thu, 14 Feb 2019 12:56:33 +0800
Message-Id: <20190214045633.15455-1-colin.xu@intel.com>
X-Mailer: git-send-email 2.20.1
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

R1ZUIGltcGxlbWVudHMgYSBob21vZ2VuZW91cyB2R1BVIGFzIGhvc3QgR1BVIHNvIG1heCB2R1BV
IGRpc3BsYXkgcGlwZXMKY2FuJ3QgZXhjZWVkIEhXLiBUaGUgaW5jb25zaXN0ZW5jeSBkZWZpbml0
aW9uIGhhcyBwb3RlbnRpYWwgcmlza3Mgd2hpY2gKY291bGQgY2F1c2UgYXJyYXkgaW5kZXhpbmcg
b3ZlcmZsb3cuCgpSZW1vdmUgdGhlIHVubmVjZXNzYXJ5IGRlZmluZSBvZiBJTlRFTF9HVlRfTUFY
X1BJUEUgYW5kIGFsaWduIHdpdGggaTkxNS4KClNpZ25lZC1vZmYtYnk6IENvbGluIFh1IDxjb2xp
bi54dUBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d2dC5oIHwgNCAr
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d2dC5oIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Z0L2d2dC5oCmluZGV4IDhiY2UwOWRlNGI4Mi4uZWY3MTBlMjU5NzI2IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3Z0LmgKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Z0L2d2dC5oCkBAIC0xMTEsMTEgKzExMSw5IEBAIHN0cnVjdCBpbnRlbF92Z3B1X2Nm
Z19zcGFjZSB7CiAKICNkZWZpbmUgdmdwdV9jZmdfc3BhY2UodmdwdSkgKCh2Z3B1KS0+Y2ZnX3Nw
YWNlLnZpcnR1YWxfY2ZnX3NwYWNlKQogCi0jZGVmaW5lIElOVEVMX0dWVF9NQVhfUElQRSA0Ci0K
IHN0cnVjdCBpbnRlbF92Z3B1X2lycSB7CiAJYm9vbCBpcnFfd2Fybl9vbmNlW0lOVEVMX0dWVF9F
VkVOVF9NQVhdOwotCURFQ0xBUkVfQklUTUFQKGZsaXBfZG9uZV9ldmVudFtJTlRFTF9HVlRfTUFY
X1BJUEVdLAorCURFQ0xBUkVfQklUTUFQKGZsaXBfZG9uZV9ldmVudFtJOTE1X01BWF9QSVBFU10s
CiAJCSAgICAgICBJTlRFTF9HVlRfRVZFTlRfTUFYKTsKIH07CiAKLS0gCjIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBt
YWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
