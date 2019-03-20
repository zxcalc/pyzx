// Initial wiring: [0 2 1 4 8 5 6 3 7]
// Resulting wiring: [0 2 1 4 7 5 6 3 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[4];
cx q[4], q[3];
cx q[7], q[6];
cx q[7], q[8];
cx q[7], q[8];
cx q[7], q[8];
cx q[1], q[0];
cx q[4], q[7];
