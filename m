Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5710:0:0:0:0:0 with SMTP id l16csp5493577ywb;
        Tue, 26 Mar 2019 19:38:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw5EFYxUOvkP15EwGjF9YJm6qX0YzRRMIq3OOU0P4cHKvv6f7D0IZV31UDL/7WCjAxR7zLE
X-Received: by 2002:aa7:8c97:: with SMTP id p23mr33567996pfd.229.1553654304943;
        Tue, 26 Mar 2019 19:38:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553654304; cv=none;
        d=google.com; s=arc-20160816;
        b=OeDbkhWmQmpCMuvg7l15VKHWck+nOtxgD8m3KSTIAsPNRFjPkfvPwIEYKf/xOd3kwc
         JPrbhK4SIV4DOAG43pqcpnOj1vRWsOCDlq9JczPJ4ImV7QCWIYKQELzvULc6fb0YMUg6
         +5QfJVGQ1kzd7z57G1h45AOMbqWKCvker2RK0cDcMrRODHEhA9YWXXHUkc33dNc0WkA+
         2SRR6oEvR75aYYYAUMsmjdepFh9XWoIig+WmxKcvPfmQRN+MfciaGl0yVk83ck5BPy/y
         /nKqlFjKouYqEIUOe4Q3N0w4RbRDMmGWv0LhQ2b52W0pzSJvFcZgrhR32dWz5Yp6q4tG
         5/yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:message-id:date:subject:to:from:delivered-to;
        bh=qnqP1ahsY9Ui0HGwpotPVmzaMq5Mo8tYAzoiPuYUUdA=;
        b=eJj+U7rm/PGYDUq5W7SLjJ+LAxdE6Q1KK98CL+mmXYTqI5G81s/tJ1NcI1SUJ6XP9r
         sDN58c3jvylb6HReZQ4WjsAfrZ0tla6s3O65tYQwet0K5T+qJTQOAV6GHxOJtG51IVZy
         Nx8tuyFpgO0Nostlg0Y5u4/uEU76NP7o1OeF2ldI6JCf1/yEsTNILCL88XzkQ2CVgr9/
         u7Efy2NCImarZOORS3YEBWVhLqF+QBxqbhgmhRwcasSAVtjUjhtVzg/jhB8dLO0U/lLp
         xdrmWKgL2+SIO7leM/PHFbUTyoi+JuQ7YhsRxbym1GwEd9BewaOEiSzkk06e/ED6/BfE
         MeTg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id n22si14996914pgk.102.2019.03.26.19.38.24
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Mar 2019 19:38:24 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C83DF89FF6;
	Wed, 27 Mar 2019 02:38:23 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4527B89FF6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 27 Mar 2019 02:38:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Mar 2019 19:38:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,274,1549958400"; d="scan'208";a="155526281"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.9])
 by fmsmga002.fm.intel.com with ESMTP; 26 Mar 2019 19:38:20 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915/gvt: do not deliver a workload if its creation
 fails
Date: Tue, 26 Mar 2019 22:32:53 -0400
Message-Id: <20190327023253.14581-1-yan.y.zhao@intel.com>
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
Cc: Yan Zhao <yan.y.zhao@intel.com>, zhenyuw@linux.intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

aW4gd29ya2xvYWQgY3JlYXRpb24gcm91dGluZSwgaWYgYW55IGZhaWx1cmUgb2NjdXJzLCBkbyBu
b3QgcXVldWUgdGhpcwp3b3JrbG9hZCBmb3IgZGVsaXZlcnkuIGlmIHRoaXMgZmFpbHVyZSBpcyBm
YXRhbCwgZW50ZXIgaW50byBmYWlsc2FmZQptb2RlCgpDYzogemhlbnl1d0BsaW51eC5pbnRlbC5j
b20KU2lnbmVkLW9mZi1ieTogWWFuIFpoYW8gPHlhbi55LnpoYW9AaW50ZWwuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9zY2hlZHVsZXIuYyB8IDUgKysrLS0KIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3Z0L3NjaGVkdWxlci5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0
L3NjaGVkdWxlci5jCmluZGV4IGMyZTNkN2JjYWM4Mi4uOGFmZjk3ZGUyYzAxIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVyLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3Z0L3NjaGVkdWxlci5jCkBAIC0xNTAzLDggKzE1MDMsOSBAQCBpbnRlbF92Z3B1
X2NyZWF0ZV93b3JrbG9hZChzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwgaW50IHJpbmdfaWQsCiAJ
CWludGVsX3J1bnRpbWVfcG1fcHV0X3VuY2hlY2tlZChkZXZfcHJpdik7CiAJfQogCi0JaWYgKHJl
dCAmJiAodmdwdV9pc192bV91bmhlYWx0aHkocmV0KSkpIHsKLQkJZW50ZXJfZmFpbHNhZmVfbW9k
ZSh2Z3B1LCBHVlRfRkFJTFNBRkVfR1VFU1RfRVJSKTsKKwlpZiAocmV0KSB7CisJCWlmICh2Z3B1
X2lzX3ZtX3VuaGVhbHRoeShyZXQpKQorCQkJZW50ZXJfZmFpbHNhZmVfbW9kZSh2Z3B1LCBHVlRf
RkFJTFNBRkVfR1VFU1RfRVJSKTsKIAkJaW50ZWxfdmdwdV9kZXN0cm95X3dvcmtsb2FkKHdvcmts
b2FkKTsKIAkJcmV0dXJuIEVSUl9QVFIocmV0KTsKIAl9Ci0tIAoyLjE3LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGlu
ZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
