Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp519251ywa;
        Wed, 13 Feb 2019 22:59:53 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ibnff0ZvLgn+YSFIkbhq/VnO5Nza22lVM2HuRHucll6veG9/JO1Z3ZjhcDHkrmiwOGv1Op0
X-Received: by 2002:a63:e553:: with SMTP id z19mr2291407pgj.331.1550127593840;
        Wed, 13 Feb 2019 22:59:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550127593; cv=none;
        d=google.com; s=arc-20160816;
        b=BM1ruxKIn6AJUxR/c0kE/PG+zacfFmGzt6Qnb+5sb+z5gwYu5UG+zq5NFe6eQNpRob
         O/Oo6vykxEOQc7XmWV5Dj5NUhKNgvzh8FexJZ7LN5KbjrF4cwR/f+Ors5WSbsUggRU2a
         9ALKfCcrhUSKbrAUK4b7OEnOjnL8t1A0xQSDJOTA30rz9ir6J0f8ciuo4NvGySUaNRCu
         UeKte3aVrKPJ9h2Z9BZOSPo/7nbHu7e68A3TOx+7PXixInflTu1IYMM+lkekFM/UvpqA
         CnJ174T3fAcSXch/PHUS9u7Hhp00zZGXXkkPAiWHf2RV4o6xbD88BnkyJPsap0On1KHd
         IHmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:date:from:message-id:subject
         :in-reply-to:to:mime-version:delivered-to;
        bh=plZGFyYyUly43kNflBEmE8AcjrSxX/YsH9iGTYaV4aE=;
        b=LdELQVy8TiVjYu8+NME7xNf+LR9jZP8+JiTfGGLs4uXLF1HAlNQGmKtYHoUPNKCFWF
         PFIe9Opy2YZH2DT8SdfKX43tO5peIDe/jpD3BzsiKqmjUmMfjjmbyupGe9PIt5MSgBiC
         atjZhQYRYoTfH2/Et1HrmINX/EmfLTK+cT2Sr8N8rUgsoCYaSaVjH9Ejq4HPky5KgN8V
         yK+VmoovfRq4pIfCmAonSgbBx0Z97aBGLH0wXH4GoIA+HDomBCgRbg3NlwXYzEF4gGxP
         oQnEhZ+ccjKJE4/5D1ioigSWkp69gwRsE+Q0uObFysdq2+ml5V8yc3FAV3RCfuaU4ZQB
         QRag==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id bc7si1688803plb.120.2019.02.13.22.59.53
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Feb 2019 22:59:53 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 061FC89BF8;
	Thu, 14 Feb 2019 06:59:53 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 279B889BF8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 14 Feb 2019 06:59:52 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Feb 2019 22:59:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,367,1544515200"; 
 d="txt'?scan'208,217";a="114818665"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by orsmga007.jf.intel.com with ESMTP; 13 Feb 2019 22:59:51 -0800
Received: from fmsmsx122.amr.corp.intel.com (10.18.125.37) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 13 Feb 2019 22:59:50 -0800
Received: from shsmsx102.ccr.corp.intel.com (10.239.4.154) by
 fmsmsx122.amr.corp.intel.com (10.18.125.37) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 13 Feb 2019 22:59:50 -0800
Received: from [127.0.1.1] (10.239.127.40) by shsmsx102.ccr.corp.intel.com
 (10.239.4.154) with Microsoft SMTP Server (TLS) id 14.3.408.0; Thu, 14 Feb
 2019 14:59:47 +0800
Content-Type: multipart/mixed; boundary="===============3230305608336645466=="
MIME-Version: 1.0
To: <intel-gvt-dev@lists.freedesktop.org>, <fenglin.hu@intel.com>
In-Reply-To: <20190214045633.15455-1-colin.xu@intel.com>
Subject: Patch Review for
 [PATCH]_drm/i915/gvt:_Use_consist_max_display_pipe_numbers_as_i915_definition
 by colin.xu:PASS
Message-ID: <4275cdae-373d-4c34-98ee-304d7b53ba8d@shsmsx102.ccr.corp.intel.com>
From: <lab_gvt-test@intel.com>
Date: Thu, 14 Feb 2019 14:59:47 +0800
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

--===============3230305608336645466==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

PGh0bWw+PGhlYWQ+PHRpdGxlPklyaXMgUHJvIDU4MCAyMDE5LTItMTQ8L3RpdGxlPjwvaGVhZD48
Ym9keT48cD48Yj48Zm9udCBmYWNlPSJ2ZXJkYW5hIj5JcmlzIFBybyA1ODAgMjAxOS0yLTE0PC9m
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

--===============3230305608336645466==
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

--===============3230305608336645466==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============3230305608336645466==--
