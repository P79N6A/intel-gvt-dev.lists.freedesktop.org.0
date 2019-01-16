Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp587897ywd;
        Wed, 16 Jan 2019 05:59:17 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7eHmyj59dqDZBpVQYQvWjDmW1e713gsplznVfhDoQyI9pL9tsa1t+VH2njaFrKY7fRvS1N
X-Received: by 2002:a62:30c3:: with SMTP id w186mr9938481pfw.39.1547647157424;
        Wed, 16 Jan 2019 05:59:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547647157; cv=none;
        d=google.com; s=arc-20160816;
        b=JnY+jaGnCzcILPSqGOhfWxrba9t+AnxThkam37H8QyVbMHtvV/BPYXaQka4ASnz4bG
         Pfr22DsQlS9uyEkJ1BHLglyz8GlUKvFDYZyybPqDHBEQLQsgZdwIH3iOyRBpPRwcf19a
         ODn2e/CoVaFFUHl64ztUDKmO/HS7uXbeJypf+pyd19YR3e0vCkdFZD7eJiA6bB8yokyJ
         zOTYo1QREhkWI9dN0pc7ABvv4TPfUYggQxlszr2q54KdOHhde6vnChPMkAjYujAWgRB4
         vVRujYJyFS+fX+YA3KIoIUWPsRujg3j7+GGLLvBaP1G2kuXjF3B9VHH5isetUyvqcGQb
         S99g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:date:from:message-id:subject
         :in-reply-to:to:mime-version:delivered-to;
        bh=hGamDzVuFIX87G8jjJPTXEjJ5gEFfDX0coQJ8FdGtss=;
        b=CyJCSHTdxJ+9GGhLqmOOoiG3aCEohkh/gWO7H57deqCtpZarVSdrSfzpbJ7e2VvZRE
         EI29CnSeGf8lPpbr20z4hkwjGruZfl8djIWkxEp83C3ewkPDSwpJHMRmaUjMVJAtDFoP
         3torzemZwZCdGRL4lOZ8FIIRSmxHElaJ6MwUKbYVKtxweLaYL5SQQ7+YpWSb6TZysiKc
         n+yfJfM49lelcFRc7PRTYn7gyvcStLG+I+GP6Ic5IDb4nxDjAiTa+UPVxPI/2+tdFjdW
         ZUYTVrT5G2CHl3hpZrNPbfff9jWwHUQ2J2QeeeeRSYHdHze/WtUpQ9sBg/39COcfcqcg
         GOuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id a16si6110568plm.365.2019.01.16.05.59.16
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Jan 2019 05:59:17 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF8786F09B;
	Wed, 16 Jan 2019 13:59:16 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2442A6F09B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 16 Jan 2019 13:59:15 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Jan 2019 05:59:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,486,1539673200"; 
 d="txt'?scan'208,217";a="126317540"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by FMSMGA003.fm.intel.com with ESMTP; 16 Jan 2019 05:59:12 -0800
Received: from fmsmsx155.amr.corp.intel.com (10.18.116.71) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 16 Jan 2019 05:59:10 -0800
Received: from shsmsx101.ccr.corp.intel.com (10.239.4.153) by
 FMSMSX155.amr.corp.intel.com (10.18.116.71) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 16 Jan 2019 05:59:09 -0800
Received: from [127.0.1.1] (10.239.127.40) by SHSMSX101.ccr.corp.intel.com
 (10.239.4.153) with Microsoft SMTP Server (TLS) id 14.3.408.0; Wed, 16 Jan
 2019 21:59:07 +0800
Content-Type: multipart/mixed; boundary="===============1663151387763762630=="
MIME-Version: 1.0
To: <intel-gvt-dev@lists.freedesktop.org>, <fenglin.hu@intel.com>
In-Reply-To: <1547639067-5181-2-git-send-email-hang.yuan@linux.intel.com>
Subject: Patch Review for
 [PATCH_v2_1/3]_drm/i915/gvt:_add_functions_to_get_default_resolution by
 hang.yuan:PASS
Message-ID: <57a3f858-5e79-4eca-8499-bb31d2fa6914@shsmsx101.ccr.corp.intel.com>
From: <lab_gvt-test@intel.com>
Date: Wed, 16 Jan 2019 21:59:07 +0800
X-Originating-IP: [10.239.127.40]
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--===============1663151387763762630==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

PGh0bWw+PGhlYWQ+PHRpdGxlPklyaXMgUHJvIDU4MCAyMDE5LTEtMTc8L3RpdGxlPjwvaGVhZD48
Ym9keT48cD48Yj48Zm9udCBmYWNlPSJ2ZXJkYW5hIj5JcmlzIFBybyA1ODAgMjAxOS0xLTE3PC9m
b250PjwvYj48L3A+PHRhYmxlIGJvcmRlcj0iMCI+PHRyPjx0ZCBjb2xzcGFuPSIzIiBhbGlnbj0i
Y2VudGVyIj48Yj5UZXN0IFJlc3VsdDwvYj48dGQ+PHRyPjx0cj48dGQgYWxpZ249ImxlZnQiPjxi
PlRvdGFsOiAxNjwvYj48L3RkPjx0ZCBhbGlnbj0ibGVmdCI+PGI+PGZvbnQgY29sb3I9ImdyZWVu
Ij5QYXNzOiAxNjwvZm9udD48L2I+PC90ZD48dGQgYWxpZ249ImxlZnQiPjxiPjxmb250IGNvbG9y
PSJyZWQiPkZhaWw6IDA8L2ZvbnQ+PC9iPjwvdGQ+PC90cj48dHI+PHRkIGNvbHNwYW49IjMiIGFs
aWduPSJjZW50ZXIiPjxiPkRldGFpbCBSZXN1bHQ8L2I+PHRkPjx0cj48dHI+PHRkIGNvbHNwYW49
IjIiPlZNTSBjcmVhdGVfbGludXg8L3RkPjx0ZD48Zm9udCBjb2xvcj0iZ3JlZW4iPlBBU1M8L2Zv
bnQ+PC90ZD48L3RyPjx0cj48dGQgY29sc3Bhbj0iMiI+Vk1NIHNodXRkb3duX2xpbnV4PC90ZD48
dGQ+PGZvbnQgY29sb3I9ImdyZWVuIj5QQVNTPC9mb250PjwvdGQ+PC90cj48dHI+PHRkIGNvbHNw
YW49IjIiPlZNTSByZWJvb3RfbGludXg8L3RkPjx0ZD48Zm9udCBjb2xvcj0iZ3JlZW4iPlBBU1M8
L2ZvbnQ+PC90ZD48L3RyPjx0cj48dGQgY29sc3Bhbj0iMiI+Vk1NIGRlc3Ryb3lfbGludXg8L3Rk
Pjx0ZD48Zm9udCBjb2xvcj0iZ3JlZW4iPlBBU1M8L2ZvbnQ+PC90ZD48L3RyPjx0cj48dGQgY29s
c3Bhbj0iMiI+Vk1NIGNyZWF0ZV8yX2xpbnV4PC90ZD48dGQ+PGZvbnQgY29sb3I9ImdyZWVuIj5Q
QVNTPC9mb250PjwvdGQ+PC90cj48dHI+PHRkIGNvbHNwYW49IjIiPlZNTSBkZXN0cm95XzJfbGlu
dXg8L3RkPjx0ZD48Zm9udCBjb2xvcj0iZ3JlZW4iPlBBU1M8L2ZvbnQ+PC90ZD48L3RyPjx0cj48
dGQgY29sc3Bhbj0iMiI+Vk1NIGNyZWF0ZV93aW4xMF82NDwvdGQ+PHRkPjxmb250IGNvbG9yPSJn
cmVlbiI+UEFTUzwvZm9udD48L3RkPjwvdHI+PHRyPjx0ZCBjb2xzcGFuPSIyIj5WTU0gc2h1dGRv
d25fd2luMTBfNjQ8L3RkPjx0ZD48Zm9udCBjb2xvcj0iZ3JlZW4iPlBBU1M8L2ZvbnQ+PC90ZD48
L3RyPjx0cj48dGQgY29sc3Bhbj0iMiI+Vk1NIHJlYm9vdF93aW4xMF82NDwvdGQ+PHRkPjxmb250
IGNvbG9yPSJncmVlbiI+UEFTUzwvZm9udD48L3RkPjwvdHI+PHRyPjx0ZCBjb2xzcGFuPSIyIj5W
TU0gZGVzdHJveV93aW4xMF82NDwvdGQ+PHRkPjxmb250IGNvbG9yPSJncmVlbiI+UEFTUzwvZm9u
dD48L3RkPjwvdHI+PHRyPjx0ZCBjb2xzcGFuPSIyIj5WTU0gY3JlYXRlX2xpbnV4X3dpbjEwXzY0
PC90ZD48dGQ+PGZvbnQgY29sb3I9ImdyZWVuIj5QQVNTPC9mb250PjwvdGQ+PC90cj48dHI+PHRk
IGNvbHNwYW49IjIiPlZNTSBjcmVhdGVfbGludXhfd2luMTBfNjRfdG9nZXRoZXI8L3RkPjx0ZD48
Zm9udCBjb2xvcj0iZ3JlZW4iPlBBU1M8L2ZvbnQ+PC90ZD48L3RyPjx0cj48dGQgY29sc3Bhbj0i
MiI+d2ludm1fdGVzdCBydW4gVHJvcGljc19yZWJvb3Qgd2luMTAtNjQ8L3RkPjx0ZD48Zm9udCBj
b2xvcj0iZ3JlZW4iPlBBU1M8L2ZvbnQ+PC90ZD48L3RyPjx0cj48dGQgY29sc3Bhbj0iMiI+bGlu
dXh2bV90ZXN0IDNEZ2FtZV9yZWJvb3Q8L3RkPjx0ZD48Zm9udCBjb2xvcj0iZ3JlZW4iPlBBU1M8
L2ZvbnQ+PC90ZD48L3RyPjx0cj48dGQgY29sc3Bhbj0iMiI+d2ludm1fdGVzdCBydW4gVkxDIHdp
bjEwLTY0PC90ZD48dGQ+PGZvbnQgY29sb3I9ImdyZWVuIj5QQVNTPC9mb250PjwvdGQ+PC90cj48
dHI+PHRkIGNvbHNwYW49IjIiPndpbnZtX3Rlc3QgcnVuIE9DTDJfYmFzaWMgd2luMTAtNjQ8L3Rk
Pjx0ZD48Zm9udCBjb2xvcj0iZ3JlZW4iPlBBU1M8L2ZvbnQ+PC90ZD48L3RyPjwvdGFibGU+PC9i
b2R5Pg==

--===============1663151387763762630==
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Type: application/octet-stream
Content-Disposition: attachment; filename="hwinfo.txt"

SGFyZHdhcmUgSW5mb3JtYXRpb24NCglCb3JhZA0KCQlOYW1lCQk6IFNreWxha2UgSGFsbyBERFI0
IFJWUDExDQoJCVZlcnNpb24JOiAxDQoJQ1BVDQoJCU5hbWUJCTogR2VudWluZSBJbnRlbChSKSBD
UFUgMDAwMCBAIDEuNjBHSHoNCgkJTWF4IFNwZWVkCTogODMwMCBNSHoNCgkJQ29yZSBFbmFibGVk
OiA0DQoJCVRocmVhZCBDb3VudDogOA0KCU1lbW9yeQ0KCQlTbG90CQk6IDINCgkJU2l6ZQkJOiA4
MTkyIE1COyA4MTkyIE1CDQoJCVR5cGUJCTogRERSNDsgRERSNA0KCQlTcGVlZAkJOiAyMTMzIE1U
L3M7IDIxMzMgTVQvcw0KCUJJT1MKDQoJCVZlcnNpb24JOiBTS0xTRTJSMS5SMDAuQjA5NS5CMDIu
MTUwODE5MTY1NQ0KCVZHQQoNCgkJTmFtZQkJOiBJcmlzIFBybyA1ODANCgkJUmV2CQk6IDA1DQoJ
CVBDSSBJRAk6IDE5M2INCgoNCg==

--===============1663151387763762630==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
Cg==

--===============1663151387763762630==--
