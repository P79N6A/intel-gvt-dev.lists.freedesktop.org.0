Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp3205431ywa;
        Tue, 19 Feb 2019 03:44:46 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZoCwwdLNbHVMzxCjMfEpD743pdBtC6zTjviauV/n13Ap/LW1AgIcpJk2qpZM9SDaNEiQW/
X-Received: by 2002:a17:902:44c:: with SMTP id 70mr29425510ple.318.1550576686450;
        Tue, 19 Feb 2019 03:44:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550576686; cv=none;
        d=google.com; s=arc-20160816;
        b=uJNNy40cYOjCkVrOLMp0aIHDVNOulA7U63Ir/ij7k6mi4bqVqTKHJ9JCxfWr45u6Ht
         QPposqSJB1F07Vr0JhoMemjvDjxlg+poCy5sfTUhG3jVF3Km5k5zFfvSacgC5CxEUnPg
         TnvOrlMft0hzxrqy9r05jNJkZEK9uh9bP8m9cBNBVtmvegdn7m3FoqYjZfuEDSwqNRkC
         GeIDoOwrScSITVwgC6zEIJC8fRZMM0SqA9VpaJCIu0h4locIovf0dgCMPtbYyNefJ1xj
         MtpXWOnZ6jNwH861jb+WDolUuYVgSpjKRUtyYKvvKnARM91M+DrWXHwYEzVSlXSrb0vH
         sgYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:date:from:message-id:subject
         :in-reply-to:to:mime-version:delivered-to;
        bh=CGTeQQj+xuYvR2Anva3ZT6l0pGa2nI7p55QAjf1mQFU=;
        b=fTw7hVjsIclguK0Gh2QDg2od8ltnQ74i9EClZH94dAT9o+0V5k4Y+WxGG3XxYYwl1m
         /FA3gfaKxm5PyhuNfeBqxlh3xVrieg1h5ezNKOQ3PGLzhyIJNMmt/lXJvLSf1YkD8FL/
         HNUV3qxMtfjVuKQZg8ob7lHVyGc/oH66owVQxUq7UT7oGu4HFp1Q0FNCDinVJVtDG/KK
         gXavQcWJQe9hFS6OjA9BXV/ZSR9nTj+fKGuJOI+iJiUBef6lVCvwAnxI+rQuhJyyBrK/
         5WS3k3PiS0gRCZMq/Yz9I25ITkhEwpU23eUdhNWG5uG0/bb/K/0e51guzhNSqPSdUv7M
         Qoqg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id f131si6023040pfc.92.2019.02.19.03.44.45
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Feb 2019 03:44:46 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A6AE89258;
	Tue, 19 Feb 2019 11:44:45 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25EBA89258
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 19 Feb 2019 11:44:45 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Feb 2019 03:44:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,388,1544515200"; 
 d="txt'?scan'208,217";a="117331533"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by orsmga006.jf.intel.com with ESMTP; 19 Feb 2019 03:44:44 -0800
Received: from shsmsx103.ccr.corp.intel.com (10.239.4.69) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Tue, 19 Feb 2019 03:44:39 -0800
Received: from [127.0.1.1] (10.239.127.40) by SHSMSX103.ccr.corp.intel.com
 (10.239.4.69) with Microsoft SMTP Server (TLS) id 14.3.408.0; Tue, 19 Feb
 2019 19:44:37 +0800
Content-Type: multipart/mixed; boundary="===============6976187133351321988=="
MIME-Version: 1.0
To: <intel-gvt-dev@lists.freedesktop.org>, <fenglin.hu@intel.com>
In-Reply-To: <20190219072401.13642-1-yan.y.zhao@intel.com>
Subject: Patch Review for
 [PATCH_2/8]_drm/i915/gvt:_Apply_g2h_adjustment_during_fence_mmio_access by
 yan.y.zhao:PASS
Message-ID: <c66b2c2f-fa3e-4e46-b843-c5c656ceb93a@shsmsx103.ccr.corp.intel.com>
From: <lab_gvt-test@intel.com>
Date: Tue, 19 Feb 2019 19:44:37 +0800
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

--===============6976187133351321988==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

PGh0bWw+PGhlYWQ+PHRpdGxlPklyaXMgUHJvIDU4MCAyMDE5LTItMjA8L3RpdGxlPjwvaGVhZD48
Ym9keT48cD48Yj48Zm9udCBmYWNlPSJ2ZXJkYW5hIj5JcmlzIFBybyA1ODAgMjAxOS0yLTIwPC9m
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

--===============6976187133351321988==
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

--===============6976187133351321988==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============6976187133351321988==--
