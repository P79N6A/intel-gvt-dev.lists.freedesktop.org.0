Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp4070838ywa;
        Tue, 19 Feb 2019 21:33:59 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYMDEHfvp5p7YeoIIA6yrO0PWP1ftWP7P0CrG4nadGthTj9qc5g2SLCjcgJAfhuqg6zsUmS
X-Received: by 2002:a62:f204:: with SMTP id m4mr32678242pfh.58.1550640839040;
        Tue, 19 Feb 2019 21:33:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550640839; cv=none;
        d=google.com; s=arc-20160816;
        b=DIiVqps86LF0YW8TBh/ZJoFFTHaxlK6AGnTg9SAan7CT3Oh8vJN2tPyRDG9plke7/o
         Uzf/hBBko9qgmdWKxmS6s5mIbeShTmq5W16QRO2Mvpe3Byyz8L+En6oSQjrSWZZMv+c6
         zj9rGUAz2Vhhhc0XUlzrE9YgdMyAUzvyikgS3DqBTaSZRuEFvB7j2IHVMu08419S5QMC
         NWf5ZRWIfl3E+UiGppAYw+bL/7erQB9WPpeXVLn3vtOen4qOxLfUX4nYZc9nXg1aA3eA
         wE67NCGquyA8kVwPIhS5jJGiP13HVsszBE/8q1WAgHxir6DpWG4MXAOvMQ8h1AeXxqI1
         jkNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:user-agent:in-reply-to:content-disposition:mime-version
         :references:message-id:subject:to:from:date:delivered-to;
        bh=g4RRBr56ffcBsEl+axu+TuRXI7J5+lxr8YA9Us2jjng=;
        b=Lvb+rXUT+nUFwluyU39npMlWEC0MWn3mTkuqVs4XnfagBNJb2sbcdmonObaVqmC+Yl
         d7U30PMC31fC81h27x+9GZ8UqdUQuCZaZrivw6jlU4c/mIQY1HVtAX694Bp4fDkG6/f0
         5fxIi3cRYj7xCF4lKmyTeWSZv//ZK3nrnn0Bfw/6s8ICp/8/RjN/tdEfckEL6XfYQKij
         CweSe0E2GzjYv5/eF6yOCB63KCd/mHDsutjQ9eLzqylSF1RUpzTt8n7nWLL18eS98Dnt
         YM3NnNnM7+XNchIzATSlEFlQTC2qN4ZnTLrze/Eg1Nw5aqXnQvDRAZcydSgTvokHuCuo
         LOWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id c131si1772783pga.358.2019.02.19.21.33.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Feb 2019 21:33:59 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68EA2891F4;
	Wed, 20 Feb 2019 05:33:58 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50099891F4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 20 Feb 2019 05:33:57 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Feb 2019 21:33:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,388,1544515200"; d="scan'208";a="148261911"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.9])
 by fmsmga001.fm.intel.com with ESMTP; 19 Feb 2019 21:33:52 -0800
Date: Wed, 20 Feb 2019 00:28:38 -0500
From: Zhao Yan <yan.y.zhao@intel.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 0/5] QEMU VFIO live migration
Message-ID: <20190220052838.GC16456@joy-OptiPlex-7040>
References: <1550566254-3545-1-git-send-email-yan.y.zhao@intel.com>
 <20190219113212.GC2941@work-vm>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190219113212.GC2941@work-vm>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: cjia@nvidia.com, kvm@vger.kernel.org, aik@ozlabs.ru,
 Zhengxiao.zx@alibaba-inc.com, shuangtai.tst@alibaba-inc.com,
 qemu-devel@nongnu.org, kwankhede@nvidia.com, eauger@redhat.com,
 yi.l.liu@intel.com, eskultet@redhat.com, ziye.yang@intel.com,
 mlevitsk@redhat.com, pasic@linux.ibm.com, arei.gonglei@huawei.com,
 felipe@nutanix.com, zhi.a.wang@intel.com, kevin.tian@intel.com,
 alex.williamson@redhat.com, intel-gvt-dev@lists.freedesktop.org,
 changpeng.liu@intel.com, cohuck@redhat.com, Ken.Xue@amd.com,
 jonathan.davies@nutanix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVHVlLCBGZWIgMTksIDIwMTkgYXQgMTE6MzI6MTNBTSArMDAwMCwgRHIuIERhdmlkIEFsYW4g
R2lsYmVydCB3cm90ZToKPiAqIFlhbiBaaGFvICh5YW4ueS56aGFvQGludGVsLmNvbSkgd3JvdGU6
Cj4gPiBUaGlzIHBhdGNoc2V0IGVuYWJsZXMgVkZJTyBkZXZpY2VzIHRvIGhhdmUgbGl2ZSBtaWdy
YXRpb24gY2FwYWJpbGl0eS4KPiA+IEN1cnJlbnRseSBpdCBkb2VzIG5vdCBzdXBwb3J0IHBvc3Qt
Y29weSBwaGFzZS4KPiA+IAo+ID4gSXQgZm9sbG93cyBBbGV4J3MgY29tbWVudHMgb24gbGFzdCB2
ZXJzaW9uIG9mIFZGSU8gbGl2ZSBtaWdyYXRpb24gcGF0Y2hlcywKPiA+IGluY2x1ZGluZyBkZXZp
Y2Ugc3RhdGVzLCBWRklPIGRldmljZSBzdGF0ZSByZWdpb24gbGF5b3V0LCBkaXJ0eSBiaXRtYXAn
cwo+ID4gcXVlcnkuCj4gCj4gSGksCj4gICBJJ3ZlIHNlbnQgbWlub3IgY29tbWVudHMgdG8gbGF0
ZXIgcGF0Y2hlczsgYnV0IHNvbWUgbWlub3IgZ2VuZXJhbAo+IGNvbW1lbnRzOgo+IAo+ICAgYSkg
TmV2ZXIgdHJ1c3QgdGhlIGluY29taW5nIG1pZ3JhdGlvbnMgc3RyZWFtIC0gaXQgbWlnaHQgYmUg
Y29ycnVwdCwKPiAgICAgc28gY2hlY2sgd2hlbiB5b3UgY2FuLgpoaSBEYXZlClRoYW5rcyBmb3Ig
dGhpcyBzdWdnZXN0aW9uLiBJJ2xsIGFkZCBtb3JlIGNoZWNrcyBmb3IgbWlncmF0aW9uIHN0cmVh
bXMuCgoKPiAgIGIpIEhvdyBkbyB3ZSBkZXRlY3QgaWYgd2UncmUgbWlncmF0aW5nIGZyb20vdG8g
dGhlIHdyb25nIGRldmljZSBvcgo+IHZlcnNpb24gb2YgZGV2aWNlPyAgT3Igc2F5IHRvIGEgZGV2
aWNlIHdpdGggb2xkZXIgZmlybXdhcmUgb3IgcGVyaGFwcwo+IGEgZGV2aWNlIHRoYXQgaGFzIGxl
c3MgZGV2aWNlIG1lbW9yeSA/CkFjdHVhbGx5IGl0J3Mgc3RpbGwgYW4gb3BlbiBmb3IgVkZJTyBt
aWdyYXRpb24uIE5lZWQgdG8gdGhpbmsgYWJvdXQKd2hldGhlciBpdCdzIGJldHRlciB0byBjaGVj
ayB0aGF0IGluIGxpYnZpcnQgb3IgcWVtdSAobGlrZSBhIGRldmljZSBtYWdpYwphbG9uZyB3aXRo
IHZlcmlvbiA/KS4KVGhpcyBwYXRjaHNldCBpcyBpbnRlbmRlZCB0byBzZXR0bGUgZG93biB0aGUg
bWFpbiBkZXZpY2Ugc3RhdGUgaW50ZXJmYWNlcwpmb3IgVkZJTyBtaWdyYXRpb24uIFNvIHRoYXQg
d2UgY2FuIHdvcmsgb24gdGhhdCBhbmQgaW1wcm92ZSBpdC4KCgo+ICAgYykgQ29uc2lkZXIgdXNp
bmcgdGhlIHRyYWNlXyBtZWNoYW5pc20gLSBpdCdzIHJlYWxseSB1c2VmdWwgdG8KPiBhZGQgdG8g
bG9vcHMgd3JpdGluZy9yZWFkaW5nIGRhdGEgc28gdGhhdCB5b3UgY2FuIHNlZSB3aGVuIGl0IGZh
aWxzLgo+IAo+IERhdmUKPgpHb3QgaXQuIG1hbnkgdGhhbmtzfn4KCgo+IChQLlMuIFlvdSBoYXZl
IGEgZmV3IHR5cG8ncyBncmVwIHlvdXIgY29kZSBmb3IgJ2RldmNpZScsICdkZXZpZScgYW5kCj4g
J21pZ3J0aW9uJwoKc29ycnkgOikKPiAKPiA+IERldmljZSBEYXRhCj4gPiAtLS0tLS0tLS0tLQo+
ID4gRGV2aWNlIGRhdGEgaXMgZGl2aWRlZCBpbnRvIHRocmVlIHR5cGVzOiBkZXZpY2UgbWVtb3J5
LCBkZXZpY2UgY29uZmlnLAo+ID4gYW5kIHN5c3RlbSBtZW1vcnkgZGlydHkgcGFnZXMgcHJvZHVj
ZWQgYnkgZGV2aWNlLgo+ID4gCj4gPiBEZXZpY2UgY29uZmlnOiBkYXRhIGxpa2UgTU1JT3MsIHBh
Z2UgdGFibGVzLi4uCj4gPiAgICAgICAgIEV2ZXJ5IGRldmljZSBpcyBzdXBwb3NlZCB0byBwb3Nz
ZXNzIGRldmljZSBjb25maWcgZGF0YS4KPiA+ICAgICAJVXN1YWxseSBkZXZpY2UgY29uZmlnJ3Mg
c2l6ZSBpcyBzbWFsbCAobm8gYmlnIHRoYW4gMTBNKSwgYW5kIGl0Cj4gPiAgICAgICAgIG5lZWRz
IHRvIGJlIGxvYWRlZCBpbiBjZXJ0YWluIHN0cmljdCBvcmRlci4KPiA+ICAgICAgICAgVGhlcmVm
b3JlLCBkZXZpY2UgY29uZmlnIG9ubHkgbmVlZHMgdG8gYmUgc2F2ZWQvbG9hZGVkIGluCj4gPiAg
ICAgICAgIHN0b3AtYW5kLWNvcHkgcGhhc2UuCj4gPiAgICAgICAgIFRoZSBkYXRhIG9mIGRldmlj
ZSBjb25maWcgaXMgaGVsZCBpbiBkZXZpY2UgY29uZmlnIHJlZ2lvbi4KPiA+ICAgICAgICAgU2l6
ZSBvZiBkZXZpY2UgY29uZmlnIGRhdGEgaXMgc21hbGxlciB0aGFuIG9yIGVxdWFsIHRvIHRoYXQg
b2YKPiA+ICAgICAgICAgZGV2aWNlIGNvbmZpZyByZWdpb24uCj4gPiAKPiA+IERldmljZSBNZW1v
cnk6IGRldmljZSdzIGludGVybmFsIG1lbW9yeSwgc3RhbmRhbG9uZSBhbmQgb3V0c2lkZSBzeXN0
ZW0KPiA+ICAgICAgICAgbWVtb3J5LiBJdCBpcyB1c3VhbGx5IHZlcnkgYmlnLgo+ID4gICAgICAg
ICBUaGlzIGtpbmQgb2YgZGF0YSBuZWVkcyB0byBiZSBzYXZlZCAvIGxvYWRlZCBpbiBwcmUtY29w
eSBhbmQKPiA+ICAgICAgICAgc3RvcC1hbmQtY29weSBwaGFzZS4KPiA+ICAgICAgICAgVGhlIGRh
dGEgb2YgZGV2aWNlIG1lbW9yeSBpcyBoZWxkIGluIGRldmljZSBtZW1vcnkgcmVnaW9uLgo+ID4g
ICAgICAgICBTaXplIG9mIGRldmllIG1lbW9yeSBpcyB1c3VhbGx5IGxhcmdlciB0aGFuIHRoYXQg
b2YgZGV2aWNlCj4gPiAgICAgICAgIG1lbW9yeSByZWdpb24uIHFlbXUgbmVlZHMgdG8gc2F2ZS9s
b2FkIGl0IGluIGNodW5rcyBvZiBzaXplIG9mCj4gPiAgICAgICAgIGRldmljZSBtZW1vcnkgcmVn
aW9uLgo+ID4gICAgICAgICBOb3QgYWxsIGRldmljZSBoYXMgZGV2aWNlIG1lbW9yeS4gTGlrZSBJ
R0Qgb25seSB1c2VzIHN5c3RlbSBtZW1vcnkuCj4gPiAKPiA+IFN5c3RlbSBtZW1vcnkgZGlydHkg
cGFnZXM6IElmIGEgZGV2aWNlIHByb2R1Y2VzIGRpcnR5IHBhZ2VzIGluIHN5c3RlbQo+ID4gICAg
ICAgICBtZW1vcnksIGl0IGlzIGFibGUgdG8gZ2V0IGRpcnR5IGJpdG1hcCBmb3IgY2VydGFpbiBy
YW5nZSBvZiBzeXN0ZW0KPiA+ICAgICAgICAgbWVtb3J5LiBUaGlzIGRpcnR5IGJpdG1hcCBpcyBx
dWVyaWVkIGluIHByZS1jb3B5IGFuZCBzdG9wLWFuZC1jb3B5Cj4gPiAgICAgICAgIHBoYXNlIGlu
IC5sb2dfc3luYyBjYWxsYmFjay4gQnkgc2V0dGluZyBkaXJ0eSBiaXRtYXAgaW4gLmxvZ19zeW5j
Cj4gPiAgICAgICAgIGNhbGxiYWNrLCBkaXJ0eSBwYWdlcyBpbiBzeXN0ZW0gbWVtb3J5IHdpbGwg
YmUgc2F2ZS9sb2FkZWQgYnkgcmFtJ3MKPiA+ICAgICAgICAgbGl2ZSBtaWdyYXRpb24gY29kZS4K
PiA+ICAgICAgICAgVGhlIGRpcnR5IGJpdG1hcCBvZiBzeXN0ZW0gbWVtb3J5IGlzIGhlbGQgaW4g
ZGlydHkgYml0bWFwIHJlZ2lvbi4KPiA+ICAgICAgICAgSWYgc3lzdGVtIG1lbW9yeSByYW5nZSBp
cyBsYXJnZXIgdGhhbiB0aGF0IGRpcnR5IGJpdG1hcCByZWdpb24gY2FuCj4gPiAgICAgICAgIGhv
bGQsIHFlbXUgd2lsbCBjdXQgaXQgaW50byBzZXZlcmFsIGNodW5rcyBhbmQgZ2V0IGRpcnR5IGJp
dG1hcCBpbgo+ID4gICAgICAgICBzdWNjZXNzaW9uLgo+ID4gCj4gPiAKPiA+IERldmljZSBTdGF0
ZSBSZWdpb25zCj4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gVmVuZG9yIGRyaXZlciBpcyBy
ZXF1aXJlZCB0byBleHBvc2UgdHdvIG1hbmRhdG9yeSByZWdpb25zIGFuZCBhbm90aGVyIHR3bwo+
ID4gb3B0aW9uYWwgcmVnaW9ucyBpZiBpdCBwbGFucyB0byBzdXBwb3J0IGRldmljZSBzdGF0ZSBt
YW5hZ2VtZW50Lgo+ID4gCj4gPiBTbywgdGhlcmUgYXJlIHVwIHRvIGZvdXIgcmVnaW9ucyBpbiB0
b3RhbC4KPiA+IE9uZSBjb250cm9sIHJlZ2lvbjogbWFuZGF0b3J5Lgo+ID4gICAgICAgICBHZXQg
YWNjZXNzIHZpYSByZWFkL3dyaXRlIHN5c3RlbSBjYWxsLgo+ID4gICAgICAgICBJdHMgbGF5b3V0
IGlzIGRlZmluZWQgaW4gc3RydWN0IHZmaW9fZGV2aWNlX3N0YXRlX2N0bAo+ID4gVGhyZWUgZGF0
YSByZWdpb25zOiBtbWFwZWQgaW50byBxZW11Lgo+ID4gICAgICAgICBkZXZpY2UgY29uZmlnIHJl
Z2lvbjogbWFuZGF0b3J5LCBob2xkaW5nIGRhdGEgb2YgZGV2aWNlIGNvbmZpZwo+ID4gICAgICAg
ICBkZXZpY2UgbWVtb3J5IHJlZ2lvbjogb3B0aW9uYWwsIGhvbGRpbmcgZGF0YSBvZiBkZXZpY2Ug
bWVtb3J5Cj4gPiAgICAgICAgIGRpcnR5IGJpdG1hcCByZWdpb246IG9wdGlvbmFsLCBob2xkaW5n
IGJpdG1hcCBvZiBzeXN0ZW0gbWVtb3J5Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ZGlydHkgcGFnZXMKPiA+IAo+ID4gKFRoZSByZWFzb24gd2h5IGZvdXIgc2VwZXJhdGUgcmVnaW9u
cyBhcmUgZGVmaW5lZCBpcyB0aGF0IHRoZSB1bml0IG9mIG1tYXAKPiA+IHN5c3RlbSBjYWxsIGlz
IFBBR0VfU0laRSwgaS5lLiA0ayBieXRlcy4gU28gb25lIHJlYWQvd3JpdGUgcmVnaW9uIGZvcgo+
ID4gY29udHJvbCBhbmQgdGhyZWUgbW1hcGVkIHJlZ2lvbnMgZm9yIGRhdGEgc2VlbXMgYmV0dGVy
IHRoYW4gb25lIGJpZyByZWdpb24KPiA+IHBhZGRlZCBhbmQgc3BhcnNlIG1tYXBlZCkuCj4gPiAK
PiA+IAo+ID4ga2VybmVsIGRldmljZSBzdGF0ZSBpbnRlcmZhY2UgWzFdCj4gPiAtLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gI2RlZmluZSBWRklPX0RFVklDRV9TVEFU
RV9JTlRFUkZBQ0VfVkVSU0lPTiAxCj4gPiAjZGVmaW5lIFZGSU9fREVWSUNFX0RBVEFfQ0FQX0RF
VklDRV9NRU1PUlkgMQo+ID4gI2RlZmluZSBWRklPX0RFVklDRV9EQVRBX0NBUF9TWVNURU1fTUVN
T1JZIDIKPiA+IAo+ID4gI2RlZmluZSBWRklPX0RFVklDRV9TVEFURV9SVU5OSU5HIDAgCj4gPiAj
ZGVmaW5lIFZGSU9fREVWSUNFX1NUQVRFX1NUT1AgMQo+ID4gI2RlZmluZSBWRklPX0RFVklDRV9T
VEFURV9MT0dHSU5HIDIKPiA+IAo+ID4gI2RlZmluZSBWRklPX0RFVklDRV9EQVRBX0FDVElPTl9H
RVRfQlVGRkVSIDEKPiA+ICNkZWZpbmUgVkZJT19ERVZJQ0VfREFUQV9BQ1RJT05fU0VUX0JVRkZF
UiAyCj4gPiAjZGVmaW5lIFZGSU9fREVWSUNFX0RBVEFfQUNUSU9OX0dFVF9CSVRNQVAgMwo+ID4g
Cj4gPiBzdHJ1Y3QgdmZpb19kZXZpY2Vfc3RhdGVfY3RsIHsKPiA+IAlfX3UzMiB2ZXJzaW9uOwkJ
ICAvKiBybyAqLwo+ID4gCV9fdTMyIGRldmljZV9zdGF0ZTsgICAgICAgLyogVkZJTyBkZXZpY2Ug
c3RhdGUsIHdvICovCj4gPiAJX191MzIgY2FwczsJCSAvKiBybyAqLwo+ID4gICAgICAgICBzdHJ1
Y3Qgewo+ID4gCQlfX3UzMiBhY3Rpb247ICAvKiB3bywgR0VUX0JVRkZFUiBvciBTRVRfQlVGRkVS
ICovIAo+ID4gCQlfX3U2NCBzaXplOyAgICAvKnJ3Ki8KPiA+IAl9IGRldmljZV9jb25maWc7Cj4g
PiAJc3RydWN0IHsKPiA+IAkJX191MzIgYWN0aW9uOyAgICAvKiB3bywgR0VUX0JVRkZFUiBvciBT
RVRfQlVGRkVSICovIAo+ID4gCQlfX3U2NCBzaXplOyAgICAgLyogcncgKi8gIAo+ID4gICAgICAg
ICAgICAgICAgIF9fdTY0IHBvczsgLyp0aGUgb2Zmc2V0IGluIHRvdGFsIGJ1ZmZlciBvZiBkZXZp
Y2UgbWVtb3J5Ki8KPiA+IAl9IGRldmljZV9tZW1vcnk7Cj4gPiAJc3RydWN0IHsKPiA+IAkJX191
NjQgc3RhcnRfYWRkcjsgLyogd28gKi8KPiA+IAkJX191NjQgcGFnZV9ucjsgICAvKiB3byAqLwo+
ID4gCX0gc3lzdGVtX21lbW9yeTsKPiA+IH07Cj4gPiAKPiA+IERldmNpZSBTdGF0ZXMKPiA+IC0t
LS0tLS0tLS0tLS0gCj4gPiBBZnRlciBtaWdyYXRpb24gaXMgaW5pdGlhbHplZCwgaXQgd2lsbCBz
ZXQgZGV2aWNlIHN0YXRlIHZpYSB3cml0aW5nIHRvCj4gPiBkZXZpY2Vfc3RhdGUgZmllbGQgb2Yg
Y29udHJvbCByZWdpb24uCj4gPiAKPiA+IEZvdXIgc3RhdGVzIGFyZSBkZWZpbmVkIGZvciBhIFZG
SU8gZGV2aWNlOgo+ID4gICAgICAgICBSVU5OSU5HLCBSVU5OSU5HICYgTE9HR0lORywgU1RPUCAm
IExPR0dJTkcsIFNUT1AgCj4gPiAKPiA+IFJVTk5JTkc6IEluIHRoaXMgc3RhdGUsIGEgVkZJTyBk
ZXZpY2UgaXMgaW4gYWN0aXZlIHN0YXRlIHJlYWR5IHRvIHJlY2VpdmUKPiA+ICAgICAgICAgY29t
bWFuZHMgZnJvbSBkZXZpY2UgZHJpdmVyLgo+ID4gICAgICAgICBJdCBpcyB0aGUgZGVmYXVsdCBz
dGF0ZSB0aGF0IGEgVkZJTyBkZXZpY2UgZW50ZXJzIGluaXRpYWxseS4KPiA+IAo+ID4gU1RPUDog
IEluIHRoaXMgc3RhdGUsIGEgVkZJTyBkZXZpY2UgaXMgZGVhY3RpdmF0ZWQgdG8gaW50ZXJhY3Qg
d2l0aAo+ID4gICAgICAgIGRldmljZSBkcml2ZXIuCj4gPiAKPiA+IExPR0dJTkc6IGEgc3BlY2lh
bCBzdGF0ZSB0aGF0IGl0IENBTk5PVCBleGlzdCBpbmRlcGVuZGVudGx5LiBJdCBtdXN0IGJlCj4g
PiAgICAgICAgc2V0IGFsb25nc2lkZSB3aXRoIHN0YXRlIFJVTk5JTkcgb3IgU1RPUCAoaS5lLiBS
VU5OSU5HICYgTE9HR0lORywKPiA+ICAgICAgICBTVE9QICYgTE9HR0lORykuCj4gPiAgICAgICAg
UWVtdSB3aWxsIHNldCBMT0dHSU5HIHN0YXRlIG9uIGluIC5zYXZlX3NldHVwIGNhbGxiYWNrcywg
dGhlbiB2ZW5kb3IKPiA+ICAgICAgICBkcml2ZXIgY2FuIHN0YXJ0IGRpcnR5IGRhdGEgbG9nZ2lu
ZyBmb3IgZGV2aWNlIG1lbW9yeSBhbmQgc3lzdGVtCj4gPiAgICAgICAgbWVtb3J5Lgo+ID4gICAg
ICAgIExPR0dJTkcgb25seSBpbXBhY3RzIGRldmljZS9zeXN0ZW0gbWVtb3J5LiBUaGV5IHJldHVy
biB3aG9sZQo+ID4gICAgICAgIHNuYXBzaG90IG91dHNpZGUgTE9HR0lORyBhbmQgZGlydHkgZGF0
YSBzaW5jZSBsYXN0IGdldCBvcGVyYXRpb24KPiA+ICAgICAgICBpbnNpZGUgTE9HR0lORy4KPiA+
ICAgICAgICBEZXZpY2UgY29uZmlnIHNob3VsZCBiZSBhbHdheXMgYWNjZXNzaWJsZSBhbmQgcmV0
dXJuIHdob2xlIGNvbmZpZwo+ID4gICAgICAgIHNuYXBzaG90IHJlZ2FyZGxlc3Mgb2YgTE9HR0lO
RyBzdGF0ZS4KPiA+ICAgICAgICAKPiA+IE5vdGU6Cj4gPiBUaGUgcmVhc29uIHdoeSBSVU5OSU5H
IGlzIHRoZSBkZWZhdWx0IHN0YXRlIGlzIHRoYXQgZGV2aWNlJ3MgYWN0aXZlIHN0YXRlCj4gPiBt
dXN0IG5vdCBkZXBlbmQgb24gZGV2aWNlIHN0YXRlIGludGVyZmFjZS4KPiA+IEl0IGlzIHBvc3Np
YmxlIHRoYXQgcmVnaW9uIHZmaW9fZGV2aWNlX3N0YXRlX2N0bCBmYWlscyB0byBnZXQgcmVnaXN0
ZXJlZC4KPiA+IEluIHRoYXQgY29uZGl0aW9uLCBhIGRldmljZSBuZWVkcyBiZSBpbiBhY3RpdmUg
c3RhdGUgYnkgZGVmYXVsdC4gCj4gPiAKPiA+IEdldCBWZXJzaW9uICYgR2V0IENhcHMKPiA+IC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+IE9uIG1pZ3JhdGlvbiBpbml0IHBoYXNlLCBxZW11IHdp
bGwgcHJvYmUgdGhlIGV4aXN0ZW5jZSBvZiBkZXZpY2Ugc3RhdGUKPiA+IHJlZ2lvbnMgb2YgdmVu
ZG9yIGRyaXZlciwgdGhlbiBnZXQgdmVyc2lvbiBvZiB0aGUgZGV2aWNlIHN0YXRlIGludGVyZmFj
ZQo+ID4gZnJvbSB0aGUgci93IGNvbnRyb2wgcmVnaW9uLgo+ID4gCj4gPiBUaGVuIGl0IHdpbGwg
cHJvYmUgVkZJTyBkZXZpY2UncyBkYXRhIGNhcGFiaWxpdHkgYnkgcmVhZGluZyBjYXBzIGZpZWxk
IG9mCj4gPiBjb250cm9sIHJlZ2lvbi4KPiA+ICAgICAgICAgI2RlZmluZSBWRklPX0RFVklDRV9E
QVRBX0NBUF9ERVZJQ0VfTUVNT1JZIDEKPiA+ICAgICAgICAgI2RlZmluZSBWRklPX0RFVklDRV9E
QVRBX0NBUF9TWVNURU1fTUVNT1JZIDIKPiA+IElmIFZGSU9fREVWSUNFX0RBVEFfQ0FQX0RFVklD
RV9NRU1PUlkgaXMgb24sIGl0IHdpbGwgc2F2ZS9sb2FkIGRhdGEgb2YKPiA+ICAgICAgICAgZGV2
aWNlIG1lbW9yeSBpbiBwcmUtY29weSBhbmQgc3RvcC1hbmQtY29weSBwaGFzZS4gVGhlIGRhdGEg
b2YKPiA+ICAgICAgICAgZGV2aWNlIG1lbW9yeSBpcyBoZWxkIGluIGRldmljZSBtZW1vcnkgcmVn
aW9uLgo+ID4gSWYgVkZJT19ERVZJQ0VfREFUQV9DQVBfU1lTVEVNX01FTU9SWSBpcyBvbiwgaXQg
d2lsbCBxdWVyeSBvZiBkaXJ0eSBwYWdlcwo+ID4gICAgICAgICBwcm9kdWNlZCBieSBWRklPIGRl
dmljZSBkdXJpbmcgcHJlLWNvcHkgYW5kIHN0b3AtYW5kLWNvcHkgcGhhc2UuCj4gPiAgICAgICAg
IFRoZSBkaXJ0eSBiaXRtYXAgb2Ygc3lzdGVtIG1lbW9yeSBpcyBoZWxkIGluIGRpcnR5IGJpdG1h
cCByZWdpb24uCj4gPiAKPiA+IElmIGZhaWxpbmcgdG8gZmluZCB0d28gbWFuZGF0b3J5IHJlZ2lv
bnMgYW5kIG9wdGlvbmFsIGRhdGEgcmVnaW9ucwo+ID4gY29ycmVzcG9uZGluZyB0byBkYXRhIGNh
cHMgb3IgdmVyc2lvbiBtaXNtYXRjaGluZywgaXQgd2lsbCBzZXR1cCBhCj4gPiBtaWdyYXRpb24g
YmxvY2tlciBhbmQgZGlzYWJsZSBsaXZlIG1pZ3JhdGlvbiBmb3IgVkZJTyBkZXZpY2UuCj4gPiAK
PiA+IAo+ID4gRmxvd3MgdG8gY2FsbCBkZXZpY2Ugc3RhdGUgaW50ZXJmYWNlIGZvciBWRklPIGxp
dmUgbWlncmF0aW9uCj4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+IAo+ID4gTGl2ZSBtaWdyYXRpb24gc2F2ZSBwYXRoOgo+
ID4gCj4gPiAoUUVNVSBMSVZFIE1JR1JBVElPTiBTVEFURSAtLT4gREVWSUNFIFNUQVRFIElOVEVS
RkFDRSAtLT4gREVWSUNFIFNUQVRFKQo+ID4gCj4gPiBNSUdSQVRJT05fU1RBVFVTX05PTkUgLS0+
IFZGSU9fREVWSUNFX1NUQVRFX1JVTk5JTkcKPiA+ICB8Cj4gPiBNSUdSQVRJT05fU1RBVFVTX1NB
VkVfU0VUVVAKPiA+ICB8Cj4gPiAgLnNhdmVfc2V0dXAgY2FsbGJhY2sgLS0+Cj4gPiAgZ2V0IGRl
dmljZSBtZW1vcnkgc2l6ZSAod2hvbGUgc25hcHNob3Qgc2l6ZSkKPiA+ICBnZXQgZGV2aWNlIG1l
bW9yeSBidWZmZXIgKHdob2xlIHNuYXBzaG90IGRhdGEpCj4gPiAgc2V0IGRldmljZSBzdGF0ZSAt
LT4gVkZJT19ERVZJQ0VfU1RBVEVfUlVOTklORyAmIFZGSU9fREVWSUNFX1NUQVRFX0xPR0dJTkcK
PiA+ICB8Cj4gPiBNSUdSQVRJT05fU1RBVFVTX0FDVElWRQo+ID4gIHwKPiA+ICAuc2F2ZV9saXZl
X3BlbmRpbmcgY2FsbGJhY2sgLS0+IGdldCBkZXZpY2UgbWVtb3J5IHNpemUgKGRpcnR5IGRhdGEp
Cj4gPiAgLnNhdmVfbGl2ZV9pdGVyYXRpb24gY2FsbGJhY2sgLS0+IGdldCBkZXZpY2UgbWVtb3J5
IGJ1ZmZlciAoZGlydHkgZGF0YSkKPiA+ICAubG9nX3N5bmMgY2FsbGJhY2sgLS0+IGdldCBzeXN0
ZW0gbWVtb3J5IGRpcnR5IGJpdG1hcAo+ID4gIHwKPiA+ICh2Y3B1IHN0b3BzKSAtLT4gc2V0IGRl
dmljZSBzdGF0ZSAtLT4KPiA+ICBWRklPX0RFVklDRV9TVEFURV9TVE9QICYgVkZJT19ERVZJQ0Vf
U1RBVEVfTE9HR0lORwo+ID4gIHwKPiA+IC5zYXZlX2xpdmVfY29tcGxldGVfcHJlY29weSBjYWxs
YmFjayAtLT4KPiA+ICBnZXQgZGV2aWNlIG1lbW9yeSBzaXplIChkaXJ0eSBkYXRhKQo+ID4gIGdl
dCBkZXZpY2UgbWVtb3J5IGJ1ZmZlciAoZGlydHkgZGF0YSkKPiA+ICBnZXQgZGV2aWNlIGNvbmZp
ZyBzaXplICh3aG9sZSBzbmFwc2hvdCBzaXplKQo+ID4gIGdldCBkZXZpY2UgY29uZmlnIGJ1ZmZl
ciAod2hvbGUgc25hcHNob3QgZGF0YSkKPiA+ICB8Cj4gPiAuc2F2ZV9jbGVhbnVwIGNhbGxiYWNr
IC0tPiAgc2V0IGRldmljZSBzdGF0ZSAtLT4gVkZJT19ERVZJQ0VfU1RBVEVfU1RPUAo+ID4gTUlH
UkFUSU9OX1NUQVRVU19DT01QTEVURUQKPiA+IAo+ID4gTUlHUkFUSU9OX1NUQVRVU19DQU5DRUxM
RUQgb3IKPiA+IE1JR1JBVElPTl9TVEFUVVNfRkFJTEVECj4gPiAgfAo+ID4gKHZjcHUgc3RhcnRz
KSAtLT4gc2V0IGRldmljZSBzdGF0ZSAtLT4gVkZJT19ERVZJQ0VfU1RBVEVfUlVOTklORwo+ID4g
Cj4gPiAKPiA+IExpdmUgbWlncmF0aW9uIGxvYWQgcGF0aDoKPiA+IAo+ID4gKFFFTVUgTElWRSBN
SUdSQVRJT04gU1RBVEUgLS0+IERFVklDRSBTVEFURSBJTlRFUkZBQ0UgLS0+IERFVklDRSBTVEFU
RSkKPiA+IAo+ID4gTUlHUkFUSU9OX1NUQVRVU19OT05FIC0tPiBWRklPX0RFVklDRV9TVEFURV9S
VU5OSU5HCj4gPiAgfAo+ID4gKHZjcHUgc3RvcHMpIC0tPiBzZXQgZGV2aWNlIHN0YXRlIC0tPiBW
RklPX0RFVklDRV9TVEFURV9TVE9QCj4gPiAgfAo+ID4gTUlHUkFUSU9OX1NUQVRVU19BQ1RJVkUK
PiA+ICB8Cj4gPiAubG9hZCBzdGF0ZSBjYWxsYmFjayAtLT4KPiA+ICBzZXQgZGV2aWNlIG1lbW9y
eSBzaXplLCBzZXQgZGV2aWNlIG1lbW9yeSBidWZmZXIsIHNldCBkZXZpY2UgY29uZmlnIHNpemUs
Cj4gPiAgc2V0IGRldmljZSBjb25maWcgYnVmZmVyCj4gPiAgfAo+ID4gKHZjcHUgc3RhcnRzKSAt
LT4gc2V0IGRldmljZSBzdGF0ZSAtLT4gVkZJT19ERVZJQ0VfU1RBVEVfUlVOTklORwo+ID4gIHwK
PiA+IE1JR1JBVElPTl9TVEFUVVNfQ09NUExFVEVECj4gPiAKPiA+IAo+ID4gCj4gPiBJbiBzb3Vy
Y2UgVk0gc2lkZSwKPiA+IEluIHByZWNvcHkgcGhhc2UsCj4gPiBpZiBhIGRldmljZSBoYXMgVkZJ
T19ERVZJQ0VfREFUQV9DQVBfREVWSUNFX01FTU9SWSBvbiwKPiA+IHFlbXUgd2lsbCBmaXJzdCBn
ZXQgd2hvbGUgc25hcHNob3Qgb2YgZGV2aWNlIG1lbW9yeSBpbiAuc2F2ZV9zZXR1cAo+ID4gY2Fs
bGJhY2ssIGFuZCB0aGVuIGl0IHdpbGwgZ2V0IHRvdGFsIHNpemUgb2YgZGlydHkgZGF0YSBpbiBk
ZXZpY2UgbWVtb3J5IGluCj4gPiAuc2F2ZV9saXZlX3BlbmRpbmcgY2FsbGJhY2sgYnkgcmVhZGlu
ZyBkZXZpY2VfbWVtb3J5LnNpemUgZmllbGQgb2YgY29udHJvbAo+ID4gcmVnaW9uLgo+ID4gVGhl
biBpbiAuc2F2ZV9saXZlX2l0ZXJhdGlvbiBjYWxsYmFjaywgaXQgd2lsbCBnZXQgYnVmZmVyIG9m
IGRldmljZSBtZW1vcnkncwo+ID4gZGlydHkgZGF0YSBjaHVuayBieSBjaHVuayBmcm9tIGRldmlj
ZSBtZW1vcnkgcmVnaW9uIGJ5IHdyaXRpbmcgcG9zICYKPiA+IGFjdGlvbiAoR0VUX0JVRkZFUikg
dG8gZGV2aWNlX21lbW9yeS5wb3MgJiBkZXZpY2VfbWVtb3J5LmFjdGlvbiBmaWVsZHMgb2YKPiA+
IGNvbnRyb2wgcmVnaW9uLiAoc2l6ZSBvZiBlYWNoIGNodW5rIGlzIHRoZSBzaXplIG9mIGRldmlj
ZSBtZW1vcnkgZGF0YQo+ID4gcmVnaW9uKS4KPiA+IC5zYXZlX2xpdmVfcGVuZGluZyBhbmQgLnNh
dmVfbGl2ZV9pdGVyYXRpb24gbWF5IGJlIGNhbGxlZCBzZXZlcmFsIHRpbWVzIGluCj4gPiBwcmVj
b3B5IHBoYXNlIHRvIGdldCBkaXJ0eSBkYXRhIGluIGRldmljZSBtZW1vcnkuCj4gPiAKPiA+IElm
IFZGSU9fREVWSUNFX0RBVEFfQ0FQX0RFVklDRV9NRU1PUlkgaXMgb2ZmLCBjYWxsYmFja3MgaW4g
cHJlY29weSBwaGFzZQo+ID4gbGlrZSAuc2F2ZV9zZXR1cCwgLnNhdmVfbGl2ZV9wZW5kaW5nLCAu
c2F2ZV9saXZlX2l0ZXJhdGlvbiB3aWxsIG5vdCBjYWxsCj4gPiB2ZW5kb3IgZHJpdmVyJ3MgZGV2
aWNlIHN0YXRlIGludGVyZmFjZSB0byBnZXQgZGF0YSBmcm9tIGRldmNpZSBtZW1vcnkuCj4gPiAK
PiA+IEluIHByZWNvcHkgcGhhc2UsIGlmIGEgZGV2aWNlIGhhcyBWRklPX0RFVklDRV9EQVRBX0NB
UF9TWVNURU1fTUVNT1JZIG9uLAo+ID4gLmxvZ19zeW5jIGNhbGxiYWNrIHdpbGwgZ2V0IHN5c3Rl
bSBtZW1vcnkgZGlydHkgYml0bWFwIGZyb20gZGlydHkgYml0bWFwCj4gPiByZWdpb24gYnkgd3Jp
dGluZyBzeXN0ZW0gbWVtb3J5J3Mgc3RhcnQgYWRkcmVzcywgcGFnZSBjb3VudCBhbmQgYWN0aW9u
IAo+ID4gKEdFVF9CSVRNQVApIHRvICJzeXN0ZW1fbWVtb3J5LnN0YXJ0X2FkZHIiLCAic3lzdGVt
X21lbW9yeS5wYWdlX25yIiwgYW5kCj4gPiAic3lzdGVtX21lbW9yeS5hY3Rpb24iIGZpZWxkcyBv
ZiBjb250cm9sIHJlZ2lvbi4KPiA+IElmIHBhZ2UgY291bnQgcGFzc2VkIGluIC5sb2dfc3luYyBj
YWxsYmFjayBpcyBsYXJnZXIgdGhhbiB0aGUgYml0bWFwIHNpemUKPiA+IHRoZSBkaXJ0eSBiaXRt
YXAgcmVnaW9uIHN1cHBvcnRzLCBRZW11IHdpbGwgY3V0IGl0IGludG8gY2h1bmtzIGFuZCBjYWxs
Cj4gPiB2ZW5kb3IgZHJpdmVyJ3MgZ2V0IHN5c3RlbSBtZW1vcnkgZGlydHkgYml0bWFwIGludGVy
ZmFjZS4KPiA+IElmIFZGSU9fREVWSUNFX0RBVEFfQ0FQX1NZU1RFTV9NRU1PUlkgaXMgb2ZmLCAu
bG9nX3N5bmMgY2FsbGJhY2sganVzdAo+ID4gcmV0dXJucyB3aXRob3V0IGNhbGwgdG8gdmVuZG9y
IGRyaXZlci4KPiA+IAo+ID4gSW4gc3RvcC1hbmQtY29weSBwaGFzZSwgZGV2aWNlIHN0YXRlIHdp
bGwgYmUgc2V0IHRvIFNUT1AgJiBMT0dHSU5HIGZpcnN0Lgo+ID4gaW4gc2F2ZV9saXZlX2NvbXBs
ZXRlX3ByZWNvcHkgY2FsbGJhY2ssCj4gPiBJZiBWRklPX0RFVklDRV9EQVRBX0NBUF9TWVNURU1f
TUVNT1JZIGlzIG9uLAo+ID4gZ2V0IGRldmljZSBtZW1vcnkgc2l6ZSBhbmQgZ2V0IGRldmljZSBt
ZW1vcnkgYnVmZmVyIHdpbGwgYmUgY2FsbGVkIGFnYWluLgo+ID4gQWZ0ZXIgdGhhdCwKPiA+IGRl
dmljZSBjb25maWcgZGF0YSBpcyBnZXQgZnJvbSBkZXZpY2UgY29uZmlnIHJlZ2lvbiBieSByZWFk
aW5nCj4gPiBkZXZjaWVfY29uZmlnLnNpemUgb2YgY29udHJvbCByZWdpb24gYW5kIHdyaXRpbmcg
YWN0aW9uIChHRVRfQklUTUFQKSB0bwo+ID4gZGV2aWNlX2NvbmZpZy5hY3Rpb24gb2YgY29udHJv
bCByZWdpb24uCj4gPiBUaGVuIGFmdGVyIG1pZ3JhdGlvbiBjb21wbGV0ZXMsIGluIGNsZWFudXAg
aGFuZGxlciwgTE9HR0lORyBzdGF0ZSB3aWxsIGJlCj4gPiBjbGVhcmVkIChpLmUuIGRlaXZjZSBz
dGF0ZSBpcyBzZXQgdG8gU1RPUCkuCj4gPiBDbGVhcmluZyBMT0dHSU5HIHN0YXRlIGluIGNsZWFu
dXAgaGFuZGxlciBpcyBpbiBjb25zaWRlcmF0aW9uIG9mIHRoZSBjYXNlCj4gPiBvZiAibWlncmF0
aW9uIGZhaWxlZCIgYW5kICJtaWdyYXRpb24gY2FuY2VsbGVkIi4gVGhleSBjYW4gYWxzbyBsZXZl
cmFnZQo+ID4gdGhlIGNsZWFudXAgaGFuZGxlciB0byB1bnNldCBMT0dHSU5HIHN0YXRlLgo+ID4g
Cj4gPiAKPiA+IFJlZmVyZW5jZXMKPiA+IC0tLS0tLS0tLS0KPiA+IDEuIGtlcm5lbCBzaWRlIGlt
cGxlbWVudGF0aW9uIG9mIERldmljZSBzdGF0ZSBpbnRlcmZhY2VzOgo+ID4gaHR0cHM6Ly9wYXRj
aHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy81Njg3Ni8KPiA+IAo+ID4gCj4gPiBZYW4gWmhh
byAoNSk6Cj4gPiAgIHZmaW8vbWlncmF0aW9uOiBkZWZpbmUga2VybmVsIGludGVyZmFjZXMKPiA+
ICAgdmZpby9taWdyYXRpb246IHN1cHBvcnQgZGV2aWNlIG9mIGRldmljZSBjb25maWcgY2FwYWJp
bGl0eQo+ID4gICB2ZmlvL21pZ3JhdGlvbjogdHJhY2tpbmcgb2YgZGlydHkgcGFnZSBpbiBzeXN0
ZW0gbWVtb3J5Cj4gPiAgIHZmaW8vbWlncmF0aW9uOiB0dXJuIG9uIG1pZ3JhdGlvbgo+ID4gICB2
ZmlvL21pZ3JhdGlvbjogc3VwcG9ydCBkZXZpY2UgbWVtb3J5IGNhcGFiaWxpdHkKPiA+IAo+ID4g
IGh3L3ZmaW8vTWFrZWZpbGUub2JqcyAgICAgICAgIHwgICAyICstCj4gPiAgaHcvdmZpby9jb21t
b24uYyAgICAgICAgICAgICAgfCAgMjYgKysKPiA+ICBody92ZmlvL21pZ3JhdGlvbi5jICAgICAg
ICAgICB8IDg1OCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+
ICBody92ZmlvL3BjaS5jICAgICAgICAgICAgICAgICB8ICAxMCArLQo+ID4gIGh3L3ZmaW8vcGNp
LmggICAgICAgICAgICAgICAgIHwgIDI2ICstCj4gPiAgaW5jbHVkZS9ody92ZmlvL3ZmaW8tY29t
bW9uLmggfCAgIDEgKwo+ID4gIGxpbnV4LWhlYWRlcnMvbGludXgvdmZpby5oICAgIHwgMjYwICsr
KysrKysrKysrKysKPiA+ICA3IGZpbGVzIGNoYW5nZWQsIDExNzQgaW5zZXJ0aW9ucygrKSwgOSBk
ZWxldGlvbnMoLSkKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaHcvdmZpby9taWdyYXRpb24uYwo+
ID4gCj4gPiAtLSAKPiA+IDIuNy40Cj4gPiAKPiAtLQo+IERyLiBEYXZpZCBBbGFuIEdpbGJlcnQg
LyBkZ2lsYmVydEByZWRoYXQuY29tIC8gTWFuY2hlc3RlciwgVUsKPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGludGVsLWd2dC1kZXYgbWFpbGluZyBs
aXN0Cj4gaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXYKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWls
aW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
