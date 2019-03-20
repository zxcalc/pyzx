// Initial wiring: [5 2 1 3 7 6 0 4 8]
// Resulting wiring: [4 2 1 3 7 6 0 5 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[4];
cx q[5], q[4];
cx q[3], q[4];
cx q[0], q[1];
cx q[7], q[4];
cx q[8], q[3];
