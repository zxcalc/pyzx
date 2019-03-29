// Initial wiring: [19, 0, 1, 2, 7, 13, 4, 3, 11, 16, 18, 6, 9, 8, 5, 15, 17, 14, 12, 10]
// Resulting wiring: [19, 0, 1, 2, 7, 13, 4, 3, 11, 16, 18, 6, 9, 8, 5, 15, 17, 14, 12, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[6];
cx q[13], q[12];
cx q[18], q[17];
cx q[18], q[12];
cx q[18], q[11];
cx q[13], q[14];
cx q[5], q[6];
cx q[3], q[6];
