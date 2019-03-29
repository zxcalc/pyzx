// Initial wiring: [16, 0, 12, 18, 6, 5, 14, 13, 3, 10, 19, 1, 4, 17, 11, 9, 7, 15, 2, 8]
// Resulting wiring: [16, 0, 12, 18, 6, 5, 14, 13, 3, 10, 19, 1, 4, 17, 11, 9, 7, 15, 2, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[3], q[2];
cx q[10], q[8];
cx q[11], q[8];
cx q[14], q[13];
cx q[18], q[17];
cx q[18], q[19];
cx q[14], q[16];
cx q[1], q[7];
