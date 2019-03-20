// Initial wiring: [0 4 2 8 1 5 6 7 3]
// Resulting wiring: [0 8 2 3 1 5 6 7 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[4];
cx q[3], q[4];
cx q[2], q[3];
cx q[3], q[8];
cx q[3], q[8];
cx q[3], q[8];
cx q[5], q[4];
cx q[1], q[2];
cx q[3], q[4];
cx q[2], q[3];
cx q[7], q[8];
