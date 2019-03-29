// Initial wiring: [10, 1, 4, 14, 13, 12, 8, 6, 0, 17, 2, 19, 16, 3, 18, 7, 9, 15, 11, 5]
// Resulting wiring: [10, 1, 4, 14, 13, 12, 8, 6, 0, 17, 2, 19, 16, 3, 18, 7, 9, 15, 11, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[3];
cx q[8], q[1];
cx q[18], q[12];
cx q[15], q[16];
cx q[11], q[17];
cx q[6], q[13];
cx q[5], q[14];
cx q[1], q[7];
