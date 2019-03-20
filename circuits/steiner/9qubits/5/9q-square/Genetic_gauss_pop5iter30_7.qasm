// Initial wiring: [1 5 2 3 4 0 6 8 7]
// Resulting wiring: [1 5 2 3 4 0 6 8 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[6];
cx q[1], q[4];
cx q[1], q[2];
cx q[5], q[6];
cx q[8], q[7];
