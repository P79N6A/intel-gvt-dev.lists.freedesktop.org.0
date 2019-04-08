Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp2091485ywo;
        Sun, 14 Apr 2019 19:22:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzjDut5/x+BdDGSPOl6Y4lxd3AQtDrHca4Sncs080hm0zyoiJNFhng6kjhGmArA3Xx6XESP
X-Received: by 2002:a62:be13:: with SMTP id l19mr71902760pff.137.1555294933170;
        Sun, 14 Apr 2019 19:22:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555294933; cv=none;
        d=google.com; s=arc-20160816;
        b=xc71+TSlytPtYLoKzXDkqL7vuTx1jKilwgBHwVI7P4m7Wt2eqoCKln6I1Xqne0pnG/
         SKWr19haES0K7QowTGYybpfA2dzcTXXlWcuR3o5LVhchZsTWn64aeayv1ZYMqJNNtQz9
         Enk7bgo5EPyrvM3Pfbfx+FBr/di8JN6JLViWMBR6IoxVbLPZhoknE2a5rEYjf/GpL4KJ
         GuAF/d4zCH3zJFbHcQeNWj0+cyLV76ndEXX5PJrUWu8pwDzgrCfWsZPcFVHHSJNIazDX
         JJIkvQlQ9zmpCsMXtSSK/XFg24PKg2Azp77AZZaOU76kdJTG9UrAbvR87F37vSYtSVr2
         JBAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:dlp-reaction
         :dlp-version:dlp-product:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:delivered-to;
        bh=g6n5cU8bMuJEhw+KZqjbVHmM5H5XQ65Mf8HWdgGNUy0=;
        b=rIUOEXRxfDV0QHNZYeJykfBIs2QUfqpeuf4r10g3qNyHbU8nZEvgPBFHrFlne4522o
         w8TfJhOeKvVLs6fq4KdsvnfjGJgxl692lv8qBqpR+xPImTCQWLKAEpY1Iy9VzusAf7HL
         UzEX1OF5qQevjPyp3x59nigASJkl2iJtgNz98SaL4IyegYhRvEgmHkOHHJEedt1DGnE1
         81bX10Ya9rc56eiWeh9wT+1DBVA5x1StcL4arbetumQ108XwNPI3wealqYL5Zftpw2Db
         PoNw0cKVlO5uUha497gijvm3vrX7CSaYkH822soIh6ljPhtQV2JBuutbKbLldonpuhbg
         j+uw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id 123si30516033pgg.104.2019.04.14.19.22.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 14 Apr 2019 19:22:13 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FABC89166;
	Mon, 15 Apr 2019 02:22:12 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 760678911B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  8 Apr 2019 08:56:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Apr 2019 01:56:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,324,1549958400"; 
 d="scan'208,217";a="133892289"
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
 by orsmga006.jf.intel.com with ESMTP; 08 Apr 2019 01:56:39 -0700
Received: from fmsmsx119.amr.corp.intel.com (10.18.124.207) by
 fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 8 Apr 2019 01:56:39 -0700
Received: from shsmsx153.ccr.corp.intel.com (10.239.6.53) by
 FMSMSX119.amr.corp.intel.com (10.18.124.207) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 8 Apr 2019 01:56:38 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.92]) by
 SHSMSX153.ccr.corp.intel.com ([169.254.12.139]) with mapi id 14.03.0415.000;
 Mon, 8 Apr 2019 16:56:36 +0800
From: "He, Yu" <yu.he@intel.com>
To: "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Subject: RE: e70f0422f03c build failure
Thread-Topic: e70f0422f03c build failure
Thread-Index: AdTt6E+ItL3PVH7zQF6YFRR650+0rgAABPrAAAAhrAA=
Date: Mon, 8 Apr 2019 08:56:37 +0000
Message-ID: <C685DB2BCFE2AF4CBCFD71F9FE83E12532918FDE@SHSMSX104.ccr.corp.intel.com>
References: <C685DB2BCFE2AF4CBCFD71F9FE83E12532918FBA@SHSMSX104.ccr.corp.intel.com>
 <EE92950F97EE42469CA4F508D4691F5E3CF4D3FC@SHSMSX104.ccr.corp.intel.com>
In-Reply-To: <EE92950F97EE42469CA4F508D4691F5E3CF4D3FC@SHSMSX104.ccr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZTA2OTk5OTAtZTQ2YS00YmZjLThkNTAtYTcxNTc5OWQ5MGJhIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiMXBpd0Y1MjRoWGgrYktrSjhmbDFmSFk2XC80dEpWM0N6bnRzSUREU3hOT3JTb1YzWEV1MGpqYURZS3liQkdPV3oifQ==
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 15 Apr 2019 02:22:11 +0000
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
Cc: "Xu, Terrence" <terrence.xu@intel.com>
Content-Type: multipart/mixed; boundary="===============1650658743=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--===============1650658743==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_C685DB2BCFE2AF4CBCFD71F9FE83E12532918FDESHSMSX104ccrcor_"

--_000_C685DB2BCFE2AF4CBCFD71F9FE83E12532918FDESHSMSX104ccrcor_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

UGxlYXNlIGhlbHAgdG8gY2hlY2ssIHRoYW5rcyENCg0KDQoNCkJlc3QgcmVnYXJkcywNCkhlLFl1
DQoNCkZyb206IFh1LCBUZXJyZW5jZQ0KU2VudDogMjAxOcTqNNTCOMjVIDE2OjUzDQpUbzogSGUs
IFl1IDx5dS5oZUBpbnRlbC5jb20+DQpTdWJqZWN0OiBSRTogZTcwZjA0MjJmMDNjIGJ1aWxkIGZh
aWx1cmUNCg0KztK5wLzGysdwYXRjaNC0tcSyu7nmt7ajrMO709DNqLn91+7QwrXEZ3Z0LXN0YWdp
bmfAtNC0tvi1vNbCoaMgOikNCg0Kv8nS1Neqt6K4+FNTUCBQUkMgVkdUIFNIIDxzc3AucHJjLnZn
dC5zaEBpbnRlbC5jb208bWFpbHRvOnNzcC5wcmMudmd0LnNoQGludGVsLmNvbT4+OyBTU1AgUFJD
IFZHVCBCSiBzc3AucHJjLnZndC5iakBpbnRlbC5jb208bWFpbHRvOnNzcC5wcmMudmd0LmJqQGlu
dGVsLmNvbT6/tL+0DQpGcm9tOiBIZSwgWXUNClNlbnQ6IE1vbmRheSwgQXByaWwgOCwgMjAxOSA0
OjUyIFBNDQpUbzogWHUsIFRlcnJlbmNlIDx0ZXJyZW5jZS54dUBpbnRlbC5jb208bWFpbHRvOnRl
cnJlbmNlLnh1QGludGVsLmNvbT4+DQpTdWJqZWN0OiBlNzBmMDQyMmYwM2MgYnVpbGQgZmFpbHVy
ZQ0KDQoNCktlcm5lbCBidWlsZCBmYWlsdXJlOg0KDQoNCg0KDQoNCisgNzNkN2RkMGM0NTI3Li4u
ZTcwZjA0MjJmMDNjIGd2dC1zdGFnaW5nIC0+IG9yaWdpbi9ndnQtc3RhZ2luZyAgKGZvcmNlZCB1
cGRhdGUpDQoNCiAqIFtuZXcgdGFnXSAgICAgICAgICAgICAgICAgICBndnQtc3RhZ2luZy0yMDE5
eS0wNG0tMDhkLTEwaC01M20tMzBzIC0+IGd2dC1zdGFnaW5nLTIwMTl5LTA0bS0wOGQtMTBoLTUz
bS0zMHMNCg0KSEVBRCBpcyBub3cgYXQgZTcwZjA0MjJmMDNjIGd2dC1zdGFnaW5nOiAyMDE5eS0w
NG0tMDhkLTEwaC01M20tMzBzIENTVCBpbnRlZ3JhdGlvbiBtYW5pZmVzdA0KDQpBbHJlYWR5IHVw
LXRvLWRhdGUuDQoNCj09PT09PVN0YXJ0IHRvIGFwcGx5IHBhdGNoIGZvciBrZXJuZWwgYnVpbGQ9
PT09PT0NCg0KPT1QYXRjaCBwYXRoOiAvcm9vdC9wYXRjaGVzL2FsZWtzZWkuZ2ltYml0c2tpaS84
X0Fwcl8yMDE5XzA4XzU0XzU4LmVtbA0KDQo9PURFUzogZHJtL2k5MTUvZ3Z0OiBSZW1vdmUgdHlw
ZWRlZiBpbnRlbF9ndnRfZ3R0X3R5cGVfdF88MjAxOTA0MDgwNTU1MDIuODQ3NC0xLWFsZWtzZWku
Z2ltYml0c2tpaUBpbnRlbC5jb208bWFpbHRvOjIwMTkwNDA4MDU1NTAyLjg0NzQtMS1hbGVrc2Vp
LmdpbWJpdHNraWlAaW50ZWwuY29tPj4NCg0KPT1CZWdpbiB0byBhcHBseSB0aGUgcGF0Y2ggd2l0
aCBnaXQgYW09PQ0KDQpBcHBseWluZzogZHJtL2k5MTUvZ3Z0OiBSZW1vdmUgdHlwZWRlZiBpbnRl
bF9ndnRfZ3R0X3R5cGVfdA0KDQo9PUFwcGx5IC9yb290L3BhdGNoZXMvYWxla3NlaS5naW1iaXRz
a2lpLzhfQXByXzIwMTlfMDhfNTRfNTguZW1sIHN1Y2Nlc3NmdWxseT09DQoNCj09QmVnaW4gdG8g
bWFrZSBjb25maWc9PQ0KDQogIEhPU1RDQyAgc2NyaXB0cy9iYXNpYy9maXhkZXANCg0KICBIT1NU
Q0MgIHNjcmlwdHMva2NvbmZpZy9jb25mLm8NCg0KICBIT1NUQ0MgIHNjcmlwdHMva2NvbmZpZy9j
b25mZGF0YS5vDQoNCiAgSE9TVENDICBzY3JpcHRzL2tjb25maWcvZXhwci5vDQoNCqGtoa0NCmRy
aXZlcnMvY3B1ZnJlcS9jcHVmcmVxX29uZGVtYW5kLmM6IEluIGZ1bmN0aW9uIKGub2Rfc2V0X3Bv
d2Vyc2F2ZV9iaWFzoa86DQpkcml2ZXJzL2NwdWZyZXEvY3B1ZnJlcV9vbmRlbWFuZC5jOjQ0OTox
OiB3YXJuaW5nOiB0aGUgZnJhbWUgc2l6ZSBvZiAxMDMyIGJ5dGVzIGlzIGxhcmdlciB0aGFuIDEw
MjQgYnl0ZXMgWy1XZnJhbWUtbGFyZ2VyLXRoYW49XQ0KfQ0KXg0KZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3Z0L2hhbmRsZXJzLmM6IEluIGZ1bmN0aW9uIKGuaGFuZGxlX2cydl9ub3RpZmljYXRpb26h
rzoNCmRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9oYW5kbGVycy5jOjEyMDk6MjogZXJyb3I6IHVu
a25vd24gdHlwZSBuYW1lIKGuaW50ZWxfZ3Z0X2d0dF90eXBlX3Shrw0KICBpbnRlbF9ndnRfZ3R0
X3R5cGVfdCByb290X2VudHJ5X3R5cGUgPSBHVFRfVFlQRV9QUEdUVF9ST09UX0w0X0VOVFJZOw0K
ICBeDQpzY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjI3NTogcmVjaXBlIGZvciB0YXJnZXQgJ2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC9oYW5kbGVycy5vJyBmYWlsZWQNCnNjcmlwdHMvTWFrZWZpbGUu
YnVpbGQ6NDg2OiByZWNpcGUgZm9yIHRhcmdldCAnZHJpdmVycy9ncHUvZHJtL2k5MTUnIGZhaWxl
ZA0KbWFrZVs3XTogKioqIFtkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMub10gRXJy
b3IgMQ0KbWFrZVs2XTogKioqIFtkcml2ZXJzL2dwdS9kcm0vaTkxNV0gRXJyb3IgMg0KbWFrZVs2
XTogKioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4uLi4NCnNjcmlwdHMvTWFrZWZpbGUu
YnVpbGQ6NDg2OiByZWNpcGUgZm9yIHRhcmdldCAnZHJpdmVycy9ncHUvZHJtJyBmYWlsZWQNCnNj
cmlwdHMvTWFrZWZpbGUuYnVpbGQ6NDg2OiByZWNpcGUgZm9yIHRhcmdldCAnZHJpdmVycy9ncHUn
IGZhaWxlZA0KbWFrZVs1XTogKioqIFtkcml2ZXJzL2dwdS9kcm1dIEVycm9yIDINCm1ha2VbNF06
ICoqKiBbZHJpdmVycy9ncHVdIEVycm9yIDINCm1ha2VbNF06ICoqKiBXYWl0aW5nIGZvciB1bmZp
bmlzaGVkIGpvYnMuLi4uDQpkcml2ZXJzL25ldC9ldGhlcm5ldC9uZXRlcmlvbi92eGdlL3Z4Z2Ut
bWFpbi5jOiBJbiBmdW5jdGlvbiChrlZYR0VfQ09NUExFVEVfVlBBVEhfVFguaXNyYS40MKGvOg0K
ZHJpdmVycy9uZXQvZXRoZXJuZXQvbmV0ZXJpb24vdnhnZS92eGdlLW1haW4uYzoxMTk6MTogd2Fy
bmluZzogdGhlIGZyYW1lIHNpemUgb2YgMTA0OCBieXRlcyBpcyBsYXJnZXIgdGhhbiAxMDI0IGJ5
dGVzIFstV2ZyYW1lLWxhcmdlci10aGFuPV0NCn0NCl4NCk1ha2VmaWxlOjEwNTE6IHJlY2lwZSBm
b3IgdGFyZ2V0ICdkcml2ZXJzJyBmYWlsZWQNCm1ha2VbM106ICoqKiBbZHJpdmVyc10gRXJyb3Ig
Mg0KZGViaWFuL3J1bGVzOjY6IHJlY2lwZSBmb3IgdGFyZ2V0ICdidWlsZCcgZmFpbGVkDQptYWtl
WzJdOiAqKiogW2J1aWxkXSBFcnJvciAyDQpkcGtnLWJ1aWxkcGFja2FnZTogZXJyb3I6IGRlYmlh
bi9ydWxlcyBidWlsZCBnYXZlIGVycm9yIGV4aXQgc3RhdHVzIDINCnNjcmlwdHMvcGFja2FnZS9N
YWtlZmlsZTo3MDogcmVjaXBlIGZvciB0YXJnZXQgJ2RlYi1wa2cnIGZhaWxlZA0KbWFrZVsxXTog
KioqIFtkZWItcGtnXSBFcnJvciAyDQpNYWtlZmlsZToxMzk2OiByZWNpcGUgZm9yIHRhcmdldCAn
ZGViLXBrZycgZmFpbGVkDQptYWtlOiAqKiogW2RlYi1wa2ddIEVycm9yIDINCg0KDQoNCkJlc3Qg
cmVnYXJkcywNCkhlLFl1DQoNCg==

--_000_C685DB2BCFE2AF4CBCFD71F9FE83E12532918FDESHSMSX104ccrcor_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Intel Clear";
	panose-1:2 11 6 4 2 2 3 2 2 4;}
@font-face
	{font-family:"\@SimSun";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Microsoft YaHei";
	panose-1:2 11 5 3 2 2 4 2 2 4;}
@font-face
	{font-family:"\@Microsoft YaHei";
	panose-1:2 11 5 3 2 2 4 2 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:SimSun;}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:SimSun;}
span.EmailStyle19
	{mso-style-type:personal;
	font-family:"Intel Clear",sans-serif;
	color:windowtext;
	font-weight:normal;
	font-style:normal;}
span.EmailStyle20
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
span.EmailStyle21
	{mso-style-type:personal-reply;
	font-family:"Intel Clear",sans-serif;
	color:#1F497D;
	font-weight:normal;
	font-style:normal;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-CN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"text-justi=
fy-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><a name=3D"_MailEndCompose"><span lang=3D"EN-US" sty=
le=3D"font-family:&quot;Intel Clear&quot;,sans-serif;color:#1F497D">Please =
help to check, thanks!<o:p></o:p></span></a></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Inte=
l Clear&quot;,sans-serif;color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"text-align:justify;text-justify:inter-ideog=
raph"><span lang=3D"EN-US" style=3D"font-family:&quot;Intel Clear&quot;,san=
s-serif;color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-align:justify;text-justify:inter-ideog=
raph"><span lang=3D"EN-US" style=3D"font-family:&quot;Intel Clear&quot;,san=
s-serif;color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-align:justify;text-justify:inter-ideog=
raph"><span lang=3D"EN-US" style=3D"font-family:&quot;Intel Clear&quot;,san=
s-serif;color:#1F497D">Best regards,<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-align:justify;text-justify:inter-ideog=
raph"><span lang=3D"EN-US" style=3D"font-family:&quot;Intel Clear&quot;,san=
s-serif;color:#1F497D">He,Yu<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Inte=
l Clear&quot;,sans-serif;color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><a name=3D"_____replyseparator"></a><b><span lang=3D=
"EN-US">From:</span></b><span lang=3D"EN-US"> Xu, Terrence
<br>
<b>Sent:</b> 2019</span><span style=3D"font-family:SimSun">=C4=EA</span><sp=
an lang=3D"EN-US">4</span><span style=3D"font-family:SimSun">=D4=C2</span><=
span lang=3D"EN-US">8</span><span style=3D"font-family:SimSun">=C8=D5</span=
><span lang=3D"EN-US"> 16:53<br>
<b>To:</b> He, Yu &lt;yu.he@intel.com&gt;<br>
<b>Subject:</b> RE: e70f0422f03c build failure<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:SimSun;color:#1F497D">=CE=
=D2=B9=C0=BC=C6=CA=C7</span><span lang=3D"EN-US" style=3D"color:#1F497D">pa=
tch</span><span style=3D"font-family:SimSun;color:#1F497D">=D0=B4=B5=C4=B2=
=BB=B9=E6=B7=B6=A3=AC=C3=BB=D3=D0=CD=A8=B9=FD=D7=EE=D0=C2=B5=C4</span><span=
 lang=3D"EN-US" style=3D"color:#1F497D">gvt-staging</span><span style=3D"fo=
nt-family:SimSun;color:#1F497D">=C0=B4=D0=B4=B6=F8=B5=BC=D6=C2=A1=A3</span>=
<span style=3D"color:#1F497D">
</span><span lang=3D"EN-US" style=3D"font-family:Wingdings;color:#1F497D">J=
</span><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:SimSun;color:#1F497D">=BF=
=C9=D2=D4=D7=AA=B7=A2=B8=F8</span><span lang=3D"EN-US" style=3D"color:#1F49=
7D">SSP PRC VGT SH &lt;<a href=3D"mailto:ssp.prc.vgt.sh@intel.com">ssp.prc.=
vgt.sh@intel.com</a>&gt;; SSP PRC VGT BJ
<a href=3D"mailto:ssp.prc.vgt.bj@intel.com">ssp.prc.vgt.bj@intel.com</a></s=
pan><span style=3D"font-family:SimSun;color:#1F497D">=BF=B4=BF=B4</span><sp=
an lang=3D"EN-US" style=3D"color:#1F497D"><o:p></o:p></span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">From:</span></b><span lang=
=3D"EN-US"> He, Yu
<br>
<b>Sent:</b> Monday, April 8, 2019 4:52 PM<br>
<b>To:</b> Xu, Terrence &lt;<a href=3D"mailto:terrence.xu@intel.com">terren=
ce.xu@intel.com</a>&gt;<br>
<b>Subject:</b> e70f0422f03c build failure<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<pre><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-family:&quot;Intel=
 Clear&quot;,sans-serif;color:#333333">Kernel build failure:<o:p></o:p></sp=
an></pre>
<pre><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-family:&quot;Intel=
 Clear&quot;,sans-serif;color:#333333"><o:p>&nbsp;</o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"font-size:10.0pt;color:#333333"><o:p>&nb=
sp;</o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"font-size:10.0pt;color:#333333">&#43; 73=
d7dd0c4527...e70f0422f03c gvt-staging -&gt; origin/gvt-staging&nbsp; (force=
d update)<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"font-size:10.0pt;color:#333333"> * [new =
tag]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gvt-staging-2019y-04m-08d-10h-53m-30s=
 -&gt; gvt-staging-2019y-04m-08d-10h-53m-30s<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"font-size:10.0pt;color:#333333">HEAD is =
now at e70f0422f03c gvt-staging: 2019y-04m-08d-10h-53m-30s CST integration =
manifest<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"font-size:10.0pt;color:#333333">Already =
up-to-date.<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"font-size:10.0pt;color:#333333">=3D=3D=
=3D=3D=3D=3DStart to apply patch for kernel build=3D=3D=3D=3D=3D=3D<o:p></o=
:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"font-size:10.0pt;color:#333333">=3D=3DPa=
tch path: /root/patches/aleksei.gimbitskii/8_Apr_2019_08_54_58.eml<o:p></o:=
p></span></pre>
<pre><span lang=3D"EN-US" style=3D"font-size:10.0pt;color:#333333">=3D=3DDE=
S: drm/i915/gvt: Remove typedef intel_gvt_gtt_type_t_&lt;<a href=3D"mailto:=
20190408055502.8474-1-aleksei.gimbitskii@intel.com">20190408055502.8474-1-a=
leksei.gimbitskii@intel.com</a>&gt;<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"font-size:10.0pt;color:#333333">=3D=3DBe=
gin to apply the patch with git am=3D=3D<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"font-size:10.0pt;color:#333333">Applying=
: drm/i915/gvt: Remove typedef intel_gvt_gtt_type_t<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"font-size:10.0pt;color:#333333">=3D=3DAp=
ply /root/patches/aleksei.gimbitskii/8_Apr_2019_08_54_58.eml successfully=
=3D=3D<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"font-size:10.0pt;color:#333333">=3D=3DBe=
gin to make config=3D=3D<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"font-size:10.0pt;color:#333333">&nbsp; H=
OSTCC&nbsp; scripts/basic/fixdep<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"font-size:10.0pt;color:#333333">&nbsp; H=
OSTCC&nbsp; scripts/kconfig/conf.o<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"font-size:10.0pt;color:#333333">&nbsp; H=
OSTCC&nbsp; scripts/kconfig/confdata.o<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US" style=3D"font-size:10.0pt;color:#333333">&nbsp; H=
OSTCC&nbsp; scripts/kconfig/expr.o<o:p></o:p></span></pre>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Inte=
l Clear&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Inte=
l Clear&quot;,sans-serif">=A1=AD=A1=AD<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:SimSun;color:#333333">drivers/cpufreq/cpufreq_ondemand.c: In functio=
n
</span><span style=3D"font-size:10.0pt;font-family:SimSun;color:#333333">=
=A1=AE<span lang=3D"EN-US">od_set_powersave_bias</span>=A1=AF<span lang=3D"=
EN-US">:<o:p></o:p></span></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:SimSun;color:#333333">drivers/cpufreq/cpufreq_ondemand.c:449:1: warn=
ing: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger=
-than=3D]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:SimSun;color:#333333">}<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:SimSun;color:#333333">^<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:SimSun;color:#333333">drivers/gpu/drm/i915/gvt/handlers.c: In functi=
on
</span><span style=3D"font-size:10.0pt;font-family:SimSun;color:#333333">=
=A1=AE<span lang=3D"EN-US">handle_g2v_notification</span>=A1=AF<span lang=
=3D"EN-US">:<o:p></o:p></span></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:SimSun;color:#333333">drivers/gpu/drm/i915/gvt/handlers.c:1209:2:
</span><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-family:SimSun;co=
lor:red">error</span><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-fa=
mily:SimSun;color:#333333">: unknown type name
</span><span style=3D"font-size:10.0pt;font-family:SimSun;color:#333333">=
=A1=AE<span lang=3D"EN-US">intel_gvt_gtt_type_t</span>=A1=AF<span lang=3D"E=
N-US"><o:p></o:p></span></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:SimSun;color:#333333">&nbsp; intel_gvt_gtt_type_t root_entry_type =
=3D GTT_TYPE_PPGTT_ROOT_L4_ENTRY;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:SimSun;color:#333333">&nbsp; ^<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:SimSun;color:#333333">scripts/Makefile.build:275: recipe for target =
'drivers/gpu/drm/i915/gvt/handlers.o' failed<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:SimSun;color:#333333">scripts/Makefile.build:486: recipe for target =
'drivers/gpu/drm/i915' failed<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:SimSun;color:#333333">make[7]: *** [drivers/gpu/drm/i915/gvt/handler=
s.o]
</span><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-family:SimSun;co=
lor:red">Error
</span><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-family:SimSun;co=
lor:#333333">1<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:SimSun;color:#333333">make[6]: *** [drivers/gpu/drm/i915]
</span><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-family:SimSun;co=
lor:red">Error
</span><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-family:SimSun;co=
lor:#333333">2<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:SimSun;color:#333333">make[6]: *** Waiting for unfinished jobs....<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:SimSun;color:#333333">scripts/Makefile.build:486: recipe for target =
'drivers/gpu/drm'
</span><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-family:SimSun;co=
lor:red">failed</span><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-f=
amily:SimSun;color:#333333"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:SimSun;color:#333333">scripts/Makefile.build:486: recipe for target =
'drivers/gpu'
</span><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-family:SimSun;co=
lor:red">failed</span><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-f=
amily:SimSun;color:#333333"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:SimSun;color:#333333">make[5]: *** [drivers/gpu/drm]
</span><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-family:SimSun;co=
lor:red">Error
</span><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-family:SimSun;co=
lor:#333333">2<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:SimSun;color:#333333">make[4]: *** [drivers/gpu]
</span><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-family:SimSun;co=
lor:red">Error
</span><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-family:SimSun;co=
lor:#333333">2<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:SimSun;color:#333333">make[4]: *** Waiting for unfinished jobs....<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:SimSun;color:#333333">drivers/net/ethernet/neterion/vxge/vxge-main.c=
: In function
</span><span style=3D"font-size:10.0pt;font-family:SimSun;color:#333333">=
=A1=AE<span lang=3D"EN-US">VXGE_COMPLETE_VPATH_TX.isra.40</span>=A1=AF<span=
 lang=3D"EN-US">:<o:p></o:p></span></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:SimSun;color:#333333">drivers/net/ethernet/neterion/vxge/vxge-main.c=
:119:1: warning: the frame size of 1048 bytes is larger than 1024 bytes [-W=
frame-larger-than=3D]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:SimSun;color:#333333">}<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:SimSun;color:#333333">^<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:SimSun;color:#333333">Makefile:1051: recipe for target 'drivers'
</span><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-family:SimSun;co=
lor:red">failed</span><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-f=
amily:SimSun;color:#333333"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:SimSun;color:#333333">make[3]: *** [drivers] Error 2<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:SimSun;color:#333333">debian/rules:6: recipe for target 'build'
</span><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-family:SimSun;co=
lor:red">failed</span><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-f=
amily:SimSun;color:#333333"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:SimSun;color:#333333">make[2]: *** [build] Error 2<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:SimSun;color:#333333">dpkg-buildpackage: error: debian/rules build g=
ave error exit status 2<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:SimSun;color:#333333">scripts/package/Makefile:70: recipe for target=
 'deb-pkg'
</span><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-family:SimSun;co=
lor:red">failed</span><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-f=
amily:SimSun;color:#333333"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:SimSun;color:#333333">make[1]: *** [deb-pkg]
</span><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-family:SimSun;co=
lor:red">Error
</span><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-family:SimSun;co=
lor:#333333">2<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:SimSun;color:#333333">Makefile:1396: recipe for target 'deb-pkg'
</span><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-family:SimSun;co=
lor:red">failed</span><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-f=
amily:SimSun;color:#333333"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:SimSun;color:#333333">make: *** [deb-pkg]
</span><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-family:SimSun;co=
lor:red">Error
</span><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-family:SimSun;co=
lor:#333333">2<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Inte=
l Clear&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-align:justify;text-justify:inter-ideog=
raph"><span lang=3D"EN-US" style=3D"font-family:&quot;Intel Clear&quot;,san=
s-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-align:justify;text-justify:inter-ideog=
raph"><span lang=3D"EN-US" style=3D"font-family:&quot;Intel Clear&quot;,san=
s-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-align:justify;text-justify:inter-ideog=
raph"><span lang=3D"EN-US" style=3D"font-family:&quot;Intel Clear&quot;,san=
s-serif">Best regards,<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-align:justify;text-justify:inter-ideog=
raph"><span lang=3D"EN-US" style=3D"font-family:&quot;Intel Clear&quot;,san=
s-serif">He,Yu<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</div>
</body>
</html>

--_000_C685DB2BCFE2AF4CBCFD71F9FE83E12532918FDESHSMSX104ccrcor_--

--===============1650658743==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1650658743==--
