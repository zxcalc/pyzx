// Initial wiring: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
// Resulting wiring: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[2], q[8];
cx q[19], q[3];
cx q[1], q[3];
cx q[11], q[17];
cx q[2], q[15];
cx q[11], q[7];
cx q[0], q[13];
cx q[18], q[12];
