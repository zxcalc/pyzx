// Initial wiring: [0 4 2 3 1 5 7 6 8]
// Resulting wiring: [0 4 2 3 1 5 7 6 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[2];
cx q[1], q[2];
cx q[5], q[6];
