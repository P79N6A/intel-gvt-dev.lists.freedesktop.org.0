Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp1281869ywd;
        Wed, 23 Jan 2019 17:03:18 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7H1n0poQc7+J7YGd/VqXbXD8vIBTWu2Jai0QYfGYfTgZTp0OEmjclwvj4hq28F91ryeoSU
X-Received: by 2002:a17:902:e18d:: with SMTP id cd13mr4522328plb.262.1548291798874;
        Wed, 23 Jan 2019 17:03:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548291798; cv=none;
        d=google.com; s=arc-20160816;
        b=ZMZ1IFZMUvdBH1DoO4BETfzONUdakGmwZz/2kLv2+ogQy+c9kWL+gMhBBjIy8wubiy
         npn35euhFjJkbQXqh43E0kESPn/LFw7n7az7p8/2bcNEMH0QXKI2n4AqTQ5UpFmrKQ7K
         WV5JtjRzEZCD06YIBgmpibYTNvRJHotzvhD9S9EKw6tEeWhddsmtlIVRxe8HxTHlX+XO
         +U5trmtmP4bXUhO1UvDjBdzBlWQX8yJMbFlAtvWfpfuMNKOCToNcEtb0slsMPBlDlowK
         WUpLwRtYJRbSB07nVAqGlHVSQH1vHZaqSB+63/Oh+fymXZFk14IMgoKupdEC7jQopOwg
         BGXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:date:message-id:in-reply-to:to
         :from:subject:mime-version:delivered-to;
        bh=1c6XlU7ZgOPRAvTj/lwtBphgVQZMqzw4dqdyKbYDnIY=;
        b=YmTI68jZkb1olbA7mSx2sufqSwqMcYMYSnHwumIa4YUWB3rvg+tLsWxM0hRGmIRMkc
         zO//pUOC7csvdcJRlKrg9ieicRuaob7Q0FcseNMrNQMBPCX6Fx8+Tfw+wRK0haHzk8xN
         c/k5QHBkrhhgFdw3ycwHig8LL4mzeJ1fnKYy3EB3TNLdkjjCZ0xqr9EndUvFQM5i/imn
         o1AQdgQSbDS4dUJdrqzjFVPyLIIPDcs4gS8SmrXztMLVswveHeTo/6D8fABnsd4oZw2J
         nkcweVIVvLGE26iGognvsLFV4qf5T57ok67TC531A2/TooA8Xqb4UZCLpv775/G4tPD1
         HOpA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id v20si20983592pgk.103.2019.01.23.17.03.18
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Jan 2019 17:03:18 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB7816F091;
	Thu, 24 Jan 2019 01:03:17 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406B86F091
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 24 Jan 2019 01:03:16 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jan 2019 17:03:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,513,1539673200"; 
 d="log'?scan'208";a="112174602"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by orsmga008.jf.intel.com with ESMTP; 23 Jan 2019 17:03:15 -0800
Received: from fmsmsx119.amr.corp.intel.com (10.18.124.207) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 23 Jan 2019 17:03:15 -0800
Received: from shsmsx104.ccr.corp.intel.com (10.239.4.70) by
 FMSMSX119.amr.corp.intel.com (10.18.124.207) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 23 Jan 2019 17:03:14 -0800
Received: from [127.0.1.1] (10.239.48.224) by SHSMSX104.ccr.corp.intel.com
 (10.239.4.70) with Microsoft SMTP Server (TLS) id 14.3.408.0; Thu, 24 Jan
 2019 09:03:12 +0800
Content-Type: multipart/mixed; boundary="===============3186444187310160465=="
MIME-Version: 1.0
Subject: Jenkins Job Failed for Patch
 [PATCH]_drm/i915/gvt:_release_shadow_batch_buffer_and_wa_ctx_before_destroy_one_workload
From: <lab_gvt-test@intel.com>
To: <intel-gvt-dev@lists.freedesktop.org>
In-Reply-To: <1548135987-8894-1-git-send-email-weinan.z.li@intel.com>
Message-ID: <80e0c0cd-b05b-4b1e-961f-66f5450d6f8c@shsmsx104.ccr.corp.intel.com>
Date: Thu, 24 Jan 2019 09:03:12 +0800
X-Originating-IP: [10.239.48.224]
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

--===============3186444187310160465==
Content-Type: text/html; charset="uft-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

CiAgICAgICAgICAgICAgICA8dGFibGUgY29sb3I9IkNDQ0MzMyIgd2lkdGg9IjgwMCIgYm9yZGVy
PSIxIiBjZWxsc3BhY2luZz0iMCIgY2VsbHBhZGRpbmc9IjUiIHRleHQtYWxpZ249ImNlbnRlciI+
CiAgICAgICAgICAgICAgICAgICAgPHRyPgogICAgICAgICAgICAgICAgICAgICAgICA8dGQgc3R5
bGU9IndvcmQtd3JhcDpicmVhay13b3JkO3dvcmQtYnJlYWs6YnJlYWstYWxsOyIgd2lkdGg9IjEw
MHB4IiB0ZXh0LWFsaWduPSJjZW50ZXIiIGJnY29sb3I9ImxpZ2h0Ymx1ZSI+U3ViamVjdDo8L3Rk
PgogICAgICAgICAgICAgICAgICAgICAgICA8dGQgbm93cmFwPSJub3dyYXAiIHRleHQtYWxpZ249
ImNlbnRlciIgYmdjb2xvcj0ibGlnaHRibHVlIj5Pd25lcjo8L3RkPgogICAgICAgICAgICAgICAg
ICAgICAgICA8dGQgbm93cmFwPSJub3dyYXAiIHRleHQtYWxpZ249ImNlbnRlciIgYmdjb2xvcj0i
bGlnaHRibHVlIj48Zm9udCBjb2xvcj0ncmVkJz5FcnJvciBUeXBlOjwvZm9udD48L3RkPgogICAg
ICAgICAgICAgICAgICAgICAgICA8dGQgbm93cmFwPSJub3dyYXAiIHRleHQtYWxpZ249ImNlbnRl
ciIgYmdjb2xvcj0ibGlnaHRibHVlIj5Mb2c6PC90ZD4KICAgICAgICAgICAgICAgICAgICA8L3Ry
PgogICAgICAgICAgICAgICAgICAgIDx0cj4KICAgICAgICAgICAgICAgICAgICAgICAgPHRkIHRl
eHQtYWxpZ249ImNlbnRlciI+W1BBVENIXV9kcm0vaTkxNS9ndnQ6X3JlbGVhc2Vfc2hhZG93X2Jh
dGNoX2J1ZmZlcl9hbmRfd2FfY3R4X2JlZm9yZV9kZXN0cm95X29uZV93b3JrbG9hZCA8L3RkPgog
ICAgICAgICAgICAgICAgICAgICAgICA8dGQ+d2VpbmFuLnoubGkgPC90ZD4KICAgICAgICAgICAg
ICAgICAgICAgICAgPHRkPmJ1aWxkX2ZhaWx1cmUgPC90ZD4KICAgICAgICAgICAgICAgICAgICAg
ICAgPHRkPmJ1aWxkIDxhIGhyZWY9Imh0dHA6Ly9ndnQtamVua2lucy5zaC5pbnRlbC5jb206ODA4
MC9qb2IvcGF0Y2gtdGVzdC1rdm1ndC8zNTIvY29uc29sZSI+MzUyPC9hPjwvdGQ+CiAgICAgICAg
ICAgICAgICAgICAgPC90cj4KICAgICAgICAgICAgICAgIDwvdGFibGU+

--===============3186444187310160465==
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Type: application/octet-stream
Content-Disposition: attachment; filename="build.log"

W3BhdGNoLXRlc3Qta3ZtZ3RdIFJ1bm5pbmcgc2hlbGwgc2NyaXB0Cisgc3NoIHJvb3RAYnVpbGRz
ZXJ2ZXItaWxhYi5zaC5pbnRlbC5jb20gY2QgL3Jvb3QvcGF0Y2gtdGVzdC1rdm1ndC87IC4vYnVp
bGQtd2l0aC1wYXRjaC5zaCAvcm9vdC9idWlsZC9wYXRjaGVzIDM1MgpGYWlsZWQgdG8gYWRkIHRo
ZSBFQ0RTQSBob3N0IGtleSBmb3IgSVAgYWRkcmVzcyAnMTAuMjM5LjQ4LjQzJyB0byB0aGUgbGlz
dCBvZiBrbm93biBob3N0cyAoL3Zhci9saWIvamVua2lucy8uc3NoL2tub3duX2hvc3RzKS4NCiAg
Q0xFQU4gICAuCiAgQ0xFQU4gICBhcmNoL3g4Ni9lbnRyeS92ZHNvCiAgQ0xFQU4gICBhcmNoL3g4
Ni9rZXJuZWwvY3B1CiAgQ0xFQU4gICBhcmNoL3g4Ni9rZXJuZWwKICBDTEVBTiAgIGFyY2gveDg2
L3B1cmdhdG9yeQogIENMRUFOICAgYXJjaC94ODYvcmVhbG1vZGUvcm0KICBDTEVBTiAgIGFyY2gv
eDg2L2xpYgogIENMRUFOICAgY2VydHMKICBDTEVBTiAgIGRyaXZlcnMvZmlybXdhcmUvZWZpL2xp
YnN0dWIKICBDTEVBTiAgIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24KICBDTEVBTiAgIGRyaXZlcnMv
bmV0L3dhbgogIENMRUFOICAgZHJpdmVycy9zY3NpL2FpYzd4eHgKICBDTEVBTiAgIGRyaXZlcnMv
c2NzaQogIENMRUFOICAgZHJpdmVycy90dHkvdnQKICBDTEVBTiAgIGtlcm5lbC9kZWJ1Zy9rZGIK
ICBDTEVBTiAgIGxpYi9yYWlkNgogIENMRUFOICAgbGliCiAgQ0xFQU4gICBuZXQvd2lyZWxlc3MK
ICBDTEVBTiAgIHNlY3VyaXR5L2FwcGFybW9yCiAgQ0xFQU4gICBzZWN1cml0eS9zZWxpbnV4CiAg
Q0xFQU4gICBzZWN1cml0eS90b21veW8KICBDTEVBTiAgIHVzcgogIENMRUFOICAgYXJjaC94ODYv
Ym9vdC9jb21wcmVzc2VkCiAgQ0xFQU4gICBhcmNoL3g4Ni9ib290CiAgQ0xFQU4gICBhcmNoL3g4
Ni90b29scwogIENMRUFOICAgLnRtcF92ZXJzaW9ucwo=

--===============3186444187310160465==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
Cg==

--===============3186444187310160465==--
