Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp6386836ywe;
        Tue, 26 Feb 2019 23:45:26 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZH6WZTMrneFnsWA6Nn6KBBDVv8bhE62QqKdlkdzCXSupbIxBzJmBp7bTMY2E4MQ1E9cMKY
X-Received: by 2002:aa7:81d7:: with SMTP id c23mr349402pfn.146.1551253526071;
        Tue, 26 Feb 2019 23:45:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551253526; cv=none;
        d=google.com; s=arc-20160816;
        b=eaKcPTFpxXAblhD+6zq6zxHkK/DqXgO9uwqrJYRRkh7W0zvvRxY7YKXqf9330lhYwr
         qqTlOQM7WvddhNIfiAVrNXnTiPNHGKMk3gcT7vVtx9faer4iKk6Sbdn/G6c/zKu3d4cI
         yG9xWV2AB6zlFqlP+OKVhg6tKqolXXdaTi7uTftgX3vFkxPEJ/7c9noK5NZ21zyyF5uL
         /wfkdrdrOp8xVsEJ/rM/QlIiXwew5JRlX8D+IArfQXZODmlQYoopsJdu6S5UCFtLQzfG
         r+JIxXLLgCLfV9e8GjfEf9nyl2/SReJbGgGzhLDAw3ABQ7HAsb1lGevcJfiFiW5taSG3
         mAjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:message-id:date:subject:to:from:delivered-to;
        bh=VYQqY05EvonoygCJ1tJomh0br0w8zHhIp6Ke6OzvyUM=;
        b=E5p4NQrtbvkR1X8qSShClnwpyC0RgHidP2jtfPNIy/zoNy5YXKRO5HG89foZfb2GI3
         qvgdLQdExz12LcwVQr2ugg4ahU2SJJiJ+ijUZsAK5F/VVx59pKtSiDVBuVkfkjF+lmzN
         jvynDWYmBQY4IlKPA0w2tqEKxGhW3Ilj55Lid3tIaGweLQn4fUyGO4AnMxVkkUePBwz5
         0c+NxqtegrcX0i87Oxa2YvrbA3ZNejKkRa21HCgX9bX3JwwdGpgDxDQJx6DxXiiO7st+
         PXVViyMl3kdr908hXd9D92cqY52XaCvTng5nZOT/omBOvqgzLo6KxDLlxzwyg2MsGloh
         NPTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id i190si15120559pfc.116.2019.02.26.23.45.25
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Feb 2019 23:45:26 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A126E086;
	Wed, 27 Feb 2019 07:45:25 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE7C46E086
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 27 Feb 2019 07:45:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Feb 2019 23:45:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,418,1544515200"; d="scan'208";a="323750871"
Received: from weinanli-build.sh.intel.com ([10.239.160.69])
 by fmsmga005.fm.intel.com with ESMTP; 26 Feb 2019 23:45:22 -0800
From: Weinan Li <weinan.z.li@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: stop scheduling workload when vgpu is inactive
Date: Wed, 27 Feb 2019 15:36:58 +0800
Message-Id: <1551253018-16671-1-git-send-email-weinan.z.li@intel.com>
X-Mailer: git-send-email 1.9.1
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
Cc: Weinan Li <weinan.z.li@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VGhlcmUgaXMgb25lIGNvcm5lciBjYXNlIHRoYXQgd29ya2xvYWRfdGhyZWFkIG1heSBwaWNrIGFu
ZCBkaXNwYXRjaCBvbmUKd29ya2xvYWQgb2YgdmdwdSBhZnRlciBpdCdzIGFscmVhZHkgZGVhY3Rp
dmF0ZWQuIEJlbG93IGlzIHRoZSBzY2VuYXJpbzoKCjEuIGRlYWN0aXZlX3ZncHUgZ290IHRoZSB2
Z3B1X2xvY2ssIGl0IGZvdW5kIHBlbmRpbmcgd29ya2xvYWQgd2FzCnN1Ym1pdHRlZCwgdGhlbiBp
dCByZWxlYXNlZCB0aGUgdmdwdV9sb2NrIGFuZCB3YWl0IGZvciB2Z3B1IGlkbGUuCjIuIGJlZm9y
ZSBkZWFjdGl2ZV92Z3B1IGdvdCB0aGUgdmdwdV9sb2NrIGJhY2ssIHdvcmtsb2FkX3RocmVhZCBt
aWdodCBwaWNrCm9uZSBuZXcgdmFsaWQgd29ya2xvYWQsIHRoZW4gaXQgd2FzIGJsb2NrZWQgYnkg
dGhlIHZncHVfbG9jay4KMy4gZGVhY3RpdmVfdmdwdSBnb3QgdGhlIHZncHVfbG9jayBhZ2Fpbiwg
ZmluaXNoZWQgdGhlIGxhc3QgcHJvY2Vzc2VzIG9mCmRlYWN0aXZhdGluZywgdGhlbiByZWxlYXNl
IHRoZSB2Z3B1X2xvY2suCjQuIHdvcmtsb2FkX3RocmVhZCBnb3QgdGhlIHZncHVfbG9jaywgdGhl
biBpdCB3aWxsIHRyeSB0byBkaXNwYXRjaCB0aGUKZmV0Y2hlZCB3b3JrbG9hZC4gSXQncyBub3Qg
ZXhwZWN0ZWQgb25lIHdvcmtsb2FkIG9mIGRlYWN0aXZhdGVkIHZncHUgaXMKZGlzcGF0Y2hlZC4K
ClRoZSBzb2x1dGlvbiBpcyB0byBhZGQgY29uZGl0aW9uIGNoZWNrIG9mIHRoZSB2Z3B1J3MgYWN0
aXZlIGZsYWcgYW5kIHN0b3AKdG8gc2NoZWR1bGUgd2hlbiBpdCdzIGluYWN0aXZlLgoKU2lnbmVk
LW9mZi1ieTogV2VpbmFuIExpIDx3ZWluYW4uei5saUBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3Z0L3NjaGVkdWxlci5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndnQvc2NoZWR1bGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVy
LmMKaW5kZXggMWJiOGY5My4uMmJjYjcwMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3Z0L3NjaGVkdWxlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9zY2hlZHVs
ZXIuYwpAQCAtNzM5LDcgKzczOSw4IEBAIHN0YXRpYyBzdHJ1Y3QgaW50ZWxfdmdwdV93b3JrbG9h
ZCAqcGlja19uZXh0X3dvcmtsb2FkKAogCQlnb3RvIG91dDsKIAl9CiAKLQlpZiAobGlzdF9lbXB0
eSh3b3JrbG9hZF9xX2hlYWQoc2NoZWR1bGVyLT5jdXJyZW50X3ZncHUsIHJpbmdfaWQpKSkKKwlp
ZiAoIXNjaGVkdWxlci0+Y3VycmVudF92Z3B1LT5hY3RpdmUgfHwKKwkgICAgbGlzdF9lbXB0eSh3
b3JrbG9hZF9xX2hlYWQoc2NoZWR1bGVyLT5jdXJyZW50X3ZncHUsIHJpbmdfaWQpKSkKIAkJZ290
byBvdXQ7CiAKIAkvKgotLSAKMS45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
